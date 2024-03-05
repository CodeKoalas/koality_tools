// ignore_for_file: unnecessary_string_escapes

import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

import 'package:koality_tools/src/commands/devops/templates/templates.dart';
import 'package:koality_tools/src/commands/devops/utilities/gitlab_variables.dart';
import 'package:koality_tools/src/models/gitlab_api/project_environment.dart';
import 'package:koality_tools/src/models/gitlab_api/project_variable.dart';
import 'package:koality_tools/src/models/result.dart';
import 'package:koality_tools/src/providers/config.dart';
import 'package:koality_tools/src/providers/gitlab_api.dart';
import 'package:koality_tools/src/services/gitlab_api.dart';

/// {@template devops_generate_command}
///
/// `koality devops generate`
/// A [Command] to generate some Gitlab AutoDevops YAML files.
/// {@endtemplate}
class DevOpsGenerateCommand extends Command<int> {
  /// {@macro devops_generate_command}
  DevOpsGenerateCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser
      ..addOption(
        'site-name',
        abbr: 's',
        help: 'The YAML safe site name (e.g. my-drupal-site).',
        mandatory: true,
      )
      ..addOption(
        'database-name',
        abbr: 'd',
        help: 'The database name we want to use.',
        mandatory: true,
      )
      ..addOption(
        'container-path',
        abbr: 'c',
        help: 'The container path of the image we want to use.',
        mandatory: true,
      )
      ..addOption(
        'site-type',
        abbr: 't',
        help: 'The type of site we are generating YAML files for.',
        allowed: _allowedTypes,
        defaultsTo: 'drupal',
      )
      ..addOption(
        'files-path',
        abbr: 'p',
        help: 'The path where we should create these YAML files, defaults to (autodevops).',
        defaultsTo: 'autodevops',
      )
      ..addOption(
        'gitlab-api-key',
        abbr: 'k',
        help: 'The Gitlab API key to use for creating environments and variables.',
      );
  }

  @override
  String get description => 'A command to run PHP linting against certain directories.';

  @override
  String get name => 'generate';

  final List<String> _allowedTypes = const ['drupal', 'laravel', 'vue', 'magento'];

  final Logger _logger;
  // ignore: unused_field
  final ProviderContainer _container;

  @override
  Future<int> run() async {
    final siteName = argResults!['site-name'] as String;
    final databaseName = argResults!['database-name'] as String;
    final containerPath = argResults!['container-path'] as String;
    final siteType = argResults!['site-type'] as String;
    final filesPath = argResults!['files-path'] as String;
    final gitlabApiToken = argResults!['gitlab-api-key'] as String? ?? '';
    _logger.info('Running devops generate command');

    // Make sure the files path exists.
    if (!Directory(filesPath).existsSync()) {
      final confirm = _logger.confirm('"./$filesPath" directory does not exist, do you want us to create it? '
          '(Folder must exist for this command to work)');
      if (confirm) {
        Directory(filesPath).createSync(recursive: true);
      } else {
        _logger.warn('Please create $filesPath and then run this command again.');
        return ExitCode.cantCreate.code;
      }
    }

    /// Now let's generate some files and then run some sed commands to replace text.
    final code = await generateAutoDevOpsFiles(
      siteType: siteType,
      siteName: siteName,
      databaseName: databaseName,
      filesPath: filesPath,
      containerPath: containerPath,
    );
    if (code != ExitCode.success.code) {
      _logger.err('Failed to generate AutoDevOps files.');
      return code;
    }

    _logger.info('AutoDevOps files generated successfully.');

    final createEnvironmentsConfirm = _logger.confirm('Do you want us to create the environments for you?');
    if (createEnvironmentsConfirm) {
      final projectIdPrompt = _logger.prompt('Please enter a valid project ID for this site.');
      if (projectIdPrompt.isEmpty) {
        _logger.err('Project ID is empty, please enter a valid project ID.');
        return ExitCode.data.code;
      }

      final projectId = int.tryParse(projectIdPrompt);
      if (projectId == null) {
        _logger.err('Project ID is not a valid number, please enter a valid project ID.');
        return ExitCode.data.code;
      }

      // Now let's grab the Gitlab API provider and let's walk the user through adding the correct environments and
      // CI/CD variables.
      final config = await _container.read(getKoalityConfigProvider(logger: _logger).future);
      if (config.gitlabConfig.gitlabAccessToken.isEmpty && gitlabApiToken.isEmpty) {
        _logger.err('Gitlab access token is empty, please set it in your config file.');
        return ExitCode.config.code;
      }

      // Allow overriding the token with the command line option.
      final realGitlabApiToken = gitlabApiToken.isNotEmpty ? gitlabApiToken : config.gitlabConfig.gitlabAccessToken;

      _logger.info('Creating environments...');
      final gitlabApi =
          await _container.read(getGitlabApiProvider(logger: _logger, accessToken: realGitlabApiToken).future);
      final environmentCode = await generateGitlabEnvironments(
        gitlabApi: gitlabApi,
        projectId: projectId,
        siteName: siteName,
      );

      if (environmentCode != ExitCode.success.code) {
        _logger.err('Failed to create environments.');
        return environmentCode;
      }

      // Now let's create the CI/CD variables we need. We have three "sets" of environment variables we need to create:
      // 1. Defaults (AUTO_DEVOPS_COMMON_NAME, AUTO_DEVOPS_DEPLOY_DEBUG, KUBE_NAMESPACE and TRACE)
      // 2. Staging variables set to the "staging" scope.
      // 3. Review variables seto the "review/*" scope.
      _logger.info('Creating CI/CD variables...');

      // Create default variables first.
      await Future.forEach(kGitlabApiGenerateVariableDefaultValues.keys, (key) async {
        // Create each of these.
        final value = kGitlabApiGenerateVariableDefaultValues[key]!;
        final variable = await gitlabApi.createProjectVariable(
          projectId: projectId,
          key: key,
          value: value,
        );
        if (!variable.isSuccess) {
          final error = switch (variable) {
            ResultSuccess<GitlabProjectVariable>() => '',
            ResultFailure(:final error, :final trace) => '$error\r\n$trace',
            _ => '',
          };
          _logger
            ..warn('Failed to create variable $key.')
            ..err(error);
        }
      });

      // Next let's get a database password set if we want.
      final databasePasswordConfirm = _logger.confirm('Would you like to create a DATABASE_PASSOWRD masked variable?');
      if (databasePasswordConfirm) {
        // Now prompt the user for the database password in a hidden prompt.
        final databasePassword = _logger.prompt('Please enter the database password:', hidden: true);
        final variable = await gitlabApi.createProjectVariable(
          projectId: projectId,
          key: 'DATABASE_PASSWORD',
          value: databasePassword,
          masked: true,
        );
        if (!variable.isSuccess) {
          final error = switch (variable) {
            ResultSuccess<GitlabProjectVariable>() => '',
            ResultFailure(:final error, :final trace) => '$error\r\n$trace',
            _ => '',
          };
          _logger
            ..warn('Failed to create variable DATABASE_PASSWORD.')
            ..err(error);
        }
      }

      // Create fillable names based on the project type.
      final variableFillableNames = getVariableFillableNamesByProjectType(siteType);
      if (variableFillableNames.isNotEmpty) {
        _logger.info("Let's create some extra variables for $siteType.");
        await createProjectVariables(
          variableFillableNames: variableFillableNames,
          gitlabApi: gitlabApi,
          siteName: siteName,
          siteType: siteType,
          projectId: projectId,
          environment: '*',
          environmentScope: '',
        );
      }

      // Now let's create the staging variables and prompt the user for values for each key.
      _logger.info("Let's create the staging variables.");
      await createProjectVariables(
        variableFillableNames: kGitlabApiGenerateVariableFillableNames,
        gitlabApi: gitlabApi,
        siteName: siteName,
        siteType: siteType,
        projectId: projectId,
        environment: 'staging',
        environmentScope: 'staging',
      );

      // Now prompt the user if they are using Review Apps and if so, let's create the review variables.
      final reviewAppsConfirm = _logger.confirm('Are you using Review Apps with Gitlab?');
      if (reviewAppsConfirm) {
        _logger.info("Let's create the review variables.");
        await createProjectVariables(
          variableFillableNames: kGitlabApiGenerateVariableFillableNames,
          gitlabApi: gitlabApi,
          siteName: siteName,
          siteType: siteType,
          projectId: projectId,
          environment: 'review',
          environmentScope: 'review/*',
        );
      }

      // Okay looks like we should be done!
      _logger.info('CI/CD variables created successfully.');
    }

    return ExitCode.success.code;
  }

  Future<int> generateAutoDevOpsFiles({
    required String siteType,
    required String siteName,
    required String databaseName,
    required String filesPath,
    String? containerPath,
    bool force = false,
  }) async {
    // Let's check to see if these files exists already and if so we skip unless force was passed.
    if (force) {
      _logger.warn('Force flag passed, we will overwrite any existing files.');
    } else {
      if (File('$filesPath/review.yaml').existsSync() && File('$filesPath/staging.yaml').existsSync()) {
        _logger.warn('AutoDevOps files already exist, skipping unless force flag is passed.');
        return ExitCode.success.code;
      }
    }

    // First create a copy of the templates/drupal/review.yaml and templates/drupal/staging.yaml files.
    final reviewFile = templateYamlFiles[siteType]!['review'] ?? '';
    final stagingFile = templateYamlFiles[siteType]!['staging'] ?? '';

    // Now let's find and replace occurrences of [SITE NAME], [DATABASE NAME], and [CONTAINER PATH] with
    // values passed to the command.
    final realContainerPath = containerPath ?? 'registry.codekoalas.com/sites/$siteName';
    final replacedReviewFileText = reviewFile
        .replaceAll('[SITE NAME]', siteName)
        .replaceAll('[DATABASE NAME]', databaseName)
        .replaceAll('[CONTAINER PATH]', realContainerPath);
    final replacedStagingFileText = stagingFile
        .replaceAll('[SITE NAME]', siteName)
        .replaceAll('[DATABASE NAME]', databaseName)
        .replaceAll('[CONTAINER PATH]', realContainerPath);

    // Now create copies inside the filesPath.
    File('$filesPath/review.yaml')
      ..createSync()
      ..writeAsStringSync(replacedReviewFileText);
    File('$filesPath/staging.yaml')
      ..createSync()
      ..writeAsStringSync(replacedStagingFileText);

    return ExitCode.success.code;
  }

  /// This function will handle generating the environments needed for the Koality Gitlab Auto Devops pipelines.
  /// It will prompt the user for the environment URLs and then create them using the Gitlab API, and avoid creating
  /// them if they already exist.
  ///
  /// This function will return the exit code of the operation.
  Future<int> generateGitlabEnvironments({
    required GitlabApi gitlabApi,
    required int projectId,
    required String siteName,
  }) async {
    // Check if environments exist.
    final stagingCheck = await gitlabApi.getProjectEnvironments(projectId: projectId, name: 'staging');
    final productionCheck = await gitlabApi.getProjectEnvironments(projectId: projectId, name: 'production');

    // Create staging if we found no environments matching "staging".
    if (stagingCheck.isSuccess) {
      final environmentUrl = _logger.prompt('Please enter the full environment URL for Staging:');
      final stagingEnvironment = await gitlabApi.createProjectEnvironment(
        projectId: projectId,
        name: 'staging',
        url: environmentUrl,
      );

      if (stagingEnvironment.isSuccess) {
        _logger.info('Staging environment created successfully.');
      } else {
        _logger.err('Failed to create staging environment. Will need to be manually created.');
      }
    } else {
      final error = switch (stagingCheck) {
        ResultSuccess<List<GitlabProjectEnvironment>>() => '',
        ResultFailure(:final error, :final trace) => '$error\r\n$trace',
        _ => '',
      };
      _logger.err('Failed to check for staging environment: $error');
      return ExitCode.software.code;
    }

    // Create production if we found no environments matching "production".
    if (productionCheck.isSuccess) {
      final environmentUrl = _logger.prompt('Please enter the full environment URL for Production:');
      final productionEnvironment = await gitlabApi.createProjectEnvironment(
        projectId: projectId,
        name: 'production',
        url: environmentUrl,
      );
      if (productionEnvironment.isSuccess) {
        _logger.info('Production environment created successfully.');
      } else {
        _logger.err('Failed to create production environment. Will need to be manually created.');
      }
    } else {
      final error = switch (productionCheck) {
        ResultSuccess<List<GitlabProjectEnvironment>>() => '',
        ResultFailure(:final error, :final trace) => '$error\r\n$trace',
        _ => '',
      };
      _logger.err('Failed to check for production environment: $error');
      return ExitCode.software.code;
    }

    _logger.info('Environments created successfully.');
    return ExitCode.success.code;
  }

  Future<void> createProjectVariables({
    required List<String> variableFillableNames,
    required GitlabApi gitlabApi,
    required String siteName,
    required String siteType,
    required int projectId,
    required String environment,
    required String environmentScope,
  }) async {
    await Future.forEach(variableFillableNames, (key) async {
      // Create an opinionated default based on how Code Koalas creates stuff.
      final defaultValue = gitlabGenerateDefaultVariableValue(
        siteName: siteName,
        siteType: siteType,
        key: key,
        environment: environment,
      );

      // Now prompt the user for the value, using the above default as a default value.
      final value = _logger.prompt(
        'Please enter a value for $key (Defaults to: $defaultValue)',
        defaultValue: defaultValue,
      );
      final variable = await gitlabApi.createProjectVariable(
        projectId: projectId,
        key: key,
        value: value,
        environmentScope: environmentScope,
      );
      if (!variable.isSuccess) {
        final error = switch (variable) {
          ResultSuccess<GitlabProjectVariable>() => '',
          ResultFailure(:final error, :final trace) => '$error\r\n$trace',
          _ => '',
        };
        _logger
          ..warn('Failed to create variable $key.')
          ..err(error);
      }
    });
  }
}

// Returns a list of extra variable names we need to create per project type.
List<String> getVariableFillableNamesByProjectType(String siteType) {
  return switch (siteType) {
    'laravel' => kGitlabApiGenerateVariableFillableNamesLaravel,
    'magento' => kGitlabApiGenerateVariableFillableNamesMagento,
    _ => [],
  };
}

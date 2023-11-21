import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

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
        mandatory: true,
        defaultsTo: 'autodevops',
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
    final siteType = argResults!['site-type'] as String;
    final filesPath = argResults!['files-path'] as String;
    _logger.info('Running devops generate command');

    // Make sure the files path exists.
    if (!Directory(filesPath).existsSync()) {
      final confirm = _logger.confirm('$filesPath does not exist, do you want us to create it?');
      if (confirm) {
        Directory(filesPath).createSync(recursive: true);
      } else {
        _logger.warn('Please create $filesPath and then run this command again.');
      }
    }

    /// Now let's generate some files and then run some sed commands to replace text.
    return generateAutoDevOpsFiles(siteType, siteName, databaseName, filesPath);
  }

  Future<int> generateAutoDevOpsFiles(String siteType, String siteName, String databaseName, String filesPath) async {
    // First create a copy of the templates/drupal/review.yaml and templates/drupal/staging.yaml files.
    final reviewFile = File('templates/$siteType/review.yaml');
    final stagingFile = File('templates/$siteType/staging.yaml');

    // Now create copies inside the filesPath.
    final reviewFileCopy = reviewFile.copySync('$filesPath/review.yaml');
    final stagingFileCopy = stagingFile.copySync('$filesPath/staging.yaml');

    // Now let's run a "sed" for [SITE NAME] inside the files with the siteName variable and [DATABASE NAME] with the
    // databaseName variables.

    // Review file changes.
    final reviewFileSedSiteName = Process.runSync('sed', ['-i', 's/\[SITE NAME\]/$siteName/g', reviewFileCopy.path]);
    final reviewFileSedDatabaseName =
        Process.runSync('sed', ['-i', 's/\[DATABASE NAME\]/$databaseName/g', reviewFileCopy.path]);

    if (reviewFileSedSiteName.exitCode != 0 || reviewFileSedDatabaseName.exitCode != 0) {
      _logger.err('There was an error running sed on the review.yaml file.');
      return ExitCode.ioError.code;
    }

    // Staging file changes.
    final stagingFileSedSiteName = Process.runSync('sed', ['-i', 's/\[SITE NAME\]/$siteName/g', stagingFileCopy.path]);
    final stagingFileSedDatabaseName =
        Process.runSync('sed', ['-i', 's/\[DATABASE NAME\]/$databaseName/g', stagingFileCopy.path]);

    if (stagingFileSedSiteName.exitCode != 0 || stagingFileSedDatabaseName.exitCode != 0) {
      _logger.err('There was an error running sed on the staging.yaml file.');
      return ExitCode.ioError.code;
    }

    return ExitCode.success.code;
  }
}

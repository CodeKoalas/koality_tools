import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:koality_tools/src/providers/config.dart';
import 'package:koality_tools/src/providers/config_manager.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// {@template config_gitlab_command}
///
/// `koality config gitlab`
/// A [Command] to generate some Gitlab AutoDevops YAML files.
/// {@endtemplate}
class ConfigGitlabCommand extends Command<int> {
  /// {@macro config_gitlab_command}
  ConfigGitlabCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser
      ..addOption('api-token', abbr: 't', help: 'The Gitlab API token to use.')
      ..addOption(
        'api-url',
        abbr: 'u',
        help: 'The Gitlab API endpoint you are using',
      );
  }

  @override
  String get description => 'A command to update Gitlab config values.';

  @override
  String get name => 'gitlab';

  final Logger _logger;
  // ignore: unused_field
  final ProviderContainer _container;

  @override
  Future<int> run() async {
    final apiToken = argResults!['api-token'] as String?;
    final apiUrl = argResults!['api-url'] as String?;

    // For each that value isn't null, update the config.
    final config = await _container.read(getKoalityConfigProvider(logger: _logger).future);
    final configManager = _container.read(getConfigManagerProvider(logger: _logger));
    final updated = config.copyWith.gitlabConfig(
      gitlabAccessToken: apiToken ?? config.gitlabConfig.gitlabAccessToken,
      gitlabApiUrl: apiUrl ?? config.gitlabConfig.gitlabApiUrl,
    );

    try {
      await configManager.saveConfig(config: updated);
    } catch (e) {
      return ExitCode.software.code;
    }

    return ExitCode.success.code;
  }
}

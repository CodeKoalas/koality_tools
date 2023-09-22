import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

import 'package:koality_tools/src/providers/config.dart';
import 'package:koality_tools/src/utilities.dart';

/// {@template setup_command}
///
/// `koality setup`
/// A [Command] to configure some local tools used by other scripts.
/// {@endtemplate}
class SetupCommand extends Command<int> {
  /// {@macro setup_command}
  SetupCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser
      ..addFlag(
        'skip-ask',
        abbr: 's',
        help: 'Skips asking for confirmation before installing tools.',
      )
      ..addOption('config-path', abbr: 'p', help: 'The path to the config file.')
      ..addOption(
        'config-file',
        abbr: 'c',
        help: 'The config file to use for sensitive data and configuration. (default: .koality_config.json)',
      );
  }

  @override
  String get description => '''
A sub command that ensures local tools are installed. 
This will ask about installing tools unless the --skip-ask flag is passed.
''';

  @override
  String get name => 'setup';

  Map<String, PackageTool> packagesToInstall = {
    'gum': PackageTool.brew,
    'curl': PackageTool.brew,
    'jq': PackageTool.brew,
    'firebase-tools': PackageTool.npm,
    'very_good_cli': PackageTool.dart,
    'rps': PackageTool.dart,
    'flutterfire_cli': PackageTool.dart,
  };

  final Logger _logger;
  final ProviderContainer _container;

  @override
  Future<int> run() async {
    final skipAsking = argResults?['skip-ask'] as bool;
    final configPath = argResults?['config-path'] as String?;
    final config = await _container.read(
      getKoalityConfigProvider(
        logger: _logger,
        overrideConfigPath: configPath,
      ).future,
    );

    if (File(config.configPath).existsSync()) {
      _logger.info('Found config file at ${config.configPath}');
    } else {
      _logger.err('No config file found at ${config.configPath}');
    }

    /// Let's install desired packages.
    await Future.wait(
      packagesToInstall.entries.map(
        (entry) async {
          await handleInstallPackage(
            logger: _logger,
            packageName: entry.key,
            tool: entry.value,
            skipAsking: skipAsking,
          );
        },
      ),
    );

    return ExitCode.success.code;
  }
}

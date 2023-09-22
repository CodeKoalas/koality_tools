import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

import 'package:koality_tools/src/models/package_install.dart';
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

  List<PackageInstallStruct> packagesToInstall = const [
    PackageInstallStruct(packageName: 'gum', commandName: 'gum', tool: PackageTool.brew),
    PackageInstallStruct(packageName: 'curl', commandName: 'curl', tool: PackageTool.brew),
    PackageInstallStruct(packageName: 'jq', commandName: 'jq', tool: PackageTool.brew),
    PackageInstallStruct(packageName: 'firebase-tools', commandName: 'firebase', tool: PackageTool.npm),
    PackageInstallStruct(packageName: 'very_good_cli', commandName: 'very_good', tool: PackageTool.dart),
    PackageInstallStruct(packageName: 'rps', commandName: 'rps', tool: PackageTool.dart),
    PackageInstallStruct(packageName: 'flutterfire_cli', commandName: 'flutterfire', tool: PackageTool.dart),
  ];

  final Logger _logger;
  final ProviderContainer _container;

  @override
  Future<int> run() async {
    final skipAsking = argResults?['skip-ask'] as bool;
    final configPath = argResults?['config-path'] as String?;

    // @NOTE: Read once here to ensure the file is created.
    // ignore: unused_local_variable
    final config = await _container.read(
      getKoalityConfigProvider(
        logger: _logger,
        overrideConfigPath: configPath,
      ).future,
    );

    /// Let's install desired packages.
    await Future.wait(
      packagesToInstall.map(
        (entry) async {
          await handleInstallPackage(
            logger: _logger,
            struct: entry,
            skipAsking: skipAsking,
          );
        },
      ),
    );

    return ExitCode.success.code;
  }
}

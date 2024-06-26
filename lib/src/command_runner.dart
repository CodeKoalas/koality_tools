import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_completion/cli_completion.dart';
import 'package:koality_tools/src/commands/apple/apple_command.dart';
import 'package:koality_tools/src/commands/devops/devops_command.dart';
import 'package:koality_tools/src/commands/drupal/drupal_command.dart';
import 'package:koality_tools/src/commands/firebase/firebase_command.dart';
import 'package:koality_tools/src/commands/jwt/jwt_command.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:pub_updater/pub_updater.dart';
import 'package:riverpod/riverpod.dart';

import 'package:koality_tools/src/commands/commands.dart';
import 'package:koality_tools/src/commands/coverage/coverage_command.dart';
import 'package:koality_tools/src/commands/kubectl/kubectl_command.dart';
import 'package:koality_tools/src/commands/parse/parse_command.dart';
import 'package:koality_tools/src/commands/refactor_command.dart';
import 'package:koality_tools/src/commands/scaffold_command.dart';
import 'package:koality_tools/src/commands/test/test_command.dart';
import 'package:koality_tools/src/constants.dart';
import 'package:koality_tools/src/version.dart';

const executableName = 'koality';
const packageName = 'koality_tools';
const description = 'A collection of useful tools created by Code Koalas.';

/// {@template koality_tools_command_runner}
/// A [CommandRunner] for the CLI.
///
/// ```
/// $ koality --version
/// ```
/// {@endtemplate}
class KoalityToolsCommandRunner extends CompletionCommandRunner<int> {
  /// {@macro koality_tools_command_runner}
  KoalityToolsCommandRunner({
    required this.container,
    required this.updater,
    Logger? logger,
  })  : _logger = logger ?? Logger(),
        super(executableName, description) {
    // Add root options and flags
    argParser
      ..addFlag(
        'version',
        abbr: 'v',
        negatable: false,
        help: 'Print the current version.',
      )
      ..addFlag(
        'verbose',
        help: 'Noisy logging, including all shell commands executed.',
      );

    // Add sub commands
    addCommand(AppleCommand(logger: _logger));
    addCommand(CoverageCommand(logger: _logger));
    addCommand(DevOpsCommand(logger: _logger, container: container));
    addCommand(DrupalCommand(logger: _logger, container: container));
    addCommand(FirebaseCommand(logger: _logger, container: container));
    addCommand(JwtCommand(logger: _logger));
    addCommand(KubectlCommand(logger: _logger, container: container));
    addCommand(ParseCommand(logger: _logger));
    addCommand(POEditorCommand(logger: _logger));
    addCommand(ScaffoldCommand(logger: _logger, container: container));
    addCommand(SetupCommand(logger: _logger, container: container));
    addCommand(RefactorCommand(logger: _logger));
    addCommand(TestRunnerCommand(logger: _logger));
    addCommand(UpdateCommand(logger: _logger, updater: updater));
  }

  @override
  void printUsage() => _logger.info(usage);

  final ProviderContainer container;
  final PubUpdater updater;
  final Logger _logger;

  @override
  Future<int> run(Iterable<String> args) async {
    try {
      final topLevelResults = parse(args);
      if (topLevelResults['verbose'] == true) {
        _logger.level = Level.verbose;
      }
      return await runCommand(topLevelResults) ?? ExitCode.success.code;
    } on FormatException catch (e, stackTrace) {
      // On format errors, show the commands error message, root usage and
      // exit with an error code
      _logger
        ..err(e.message)
        ..err('$stackTrace')
        ..info('')
        ..info(usage);
      return ExitCode.usage.code;
    } on UsageException catch (e) {
      // On usage errors, show the commands usage message and
      // exit with an error code
      _logger
        ..err(e.message)
        ..info('')
        ..info(e.usage);
      return ExitCode.usage.code;
    }
  }

  @override
  Future<int?> runCommand(ArgResults topLevelResults) async {
    if (topLevelResults.command?.name == 'completion') {
      await super.runCommand(topLevelResults);
      return ExitCode.success.code;
    }

    _logger
      ..detail('Argument information:')
      ..detail('  Top level options:');
    for (final option in topLevelResults.options) {
      if (topLevelResults.wasParsed(option)) {
        _logger.detail('  - $option: ${topLevelResults[option]}');
      }
    }
    writeCommandOptionDetails(topLevelResults);

    final int? exitCode;
    if (topLevelResults['version'] == true) {
      _logger.info(packageVersion);
      exitCode = ExitCode.success.code;
    } else {
      exitCode = await super.runCommand(topLevelResults);
    }
    if (topLevelResults.command?.name != UpdateCommand.commandName) {
      await _checkForUpdates();
    }
    return exitCode;
  }

  /// Write out a formatted list of options for this command.
  void writeCommandOptionDetails(ArgResults topLevelResults) {
    if (topLevelResults.command != null) {
      final commandResult = topLevelResults.command!;
      _logger
        ..detail('  Command: ${commandResult.name}')
        ..detail('    Command options:');
      for (final option in commandResult.options) {
        if (commandResult.wasParsed(option)) {
          _logger.detail('    - $option: ${commandResult[option]}');
        }
      }
    }
  }

  /// Checks if the current version (set by the build runner on the
  /// version.dart file) is the most recent one. If not, show a prompt to the
  /// user.
  Future<void> _checkForUpdates() async {
    try {
      final latestVersion = await updater.getLatestVersion(kPackageName);
      final isUpToDate = packageVersion == latestVersion;
      if (!isUpToDate) {
        _logger
          ..info('')
          ..info(
            '''
${lightYellow.wrap('Update available!')} ${lightCyan.wrap(packageVersion)} \u2192 ${lightCyan.wrap(latestVersion)}
Run ${lightCyan.wrap('$executableName update')} to update''',
          );
      }
    } catch (_) {}
  }
}

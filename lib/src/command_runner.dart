import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli_completion/cli_completion.dart';
import 'package:koality_tools/src/commands/parse/parse_command.dart';
import 'package:mason_logger/mason_logger.dart';

import 'package:koality_tools/src/commands/commands.dart';
import 'package:koality_tools/src/commands/coverage_helper_command.dart';
import 'package:koality_tools/src/commands/kubectl/kubectl_command.dart';
import 'package:koality_tools/src/commands/test_runner_command.dart';
import 'package:koality_tools/src/commands/updater.dart';
import 'package:koality_tools/src/version.dart';
import 'package:riverpod/riverpod.dart';

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
    Logger? logger,
    PackageUpdater? updater,
  })  : _logger = logger ?? Logger(),
        _updater = updater ?? PackageUpdater(),
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
    addCommand(SetupCommand(logger: _logger, container: container));
    addCommand(CoverageHelperCommand(logger: _logger));
    addCommand(POEditorCommand(logger: _logger));
    addCommand(KubectlCommand(logger: _logger, container: container));
    addCommand(TestRunnerCommand(logger: _logger));
    addCommand(ParseCommand(logger: _logger));
    addCommand(UpdateCommand(logger: _logger, updater: _updater));
  }

  @override
  void printUsage() => _logger.info(usage);

  final ProviderContainer container;
  final Logger _logger;
  final PackageUpdater _updater;

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

  /// Checks if the current version (set by the build runner on the
  /// version.dart file) is the most recent one. If not, show a prompt to the
  /// user.
  Future<void> _checkForUpdates() async {
    try {
      final latestVersion = await _updater.getLatestVersion();
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
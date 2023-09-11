import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

// Sub commands.
import 'package:koality_tools/src/commands/riverpod/commands/generate_command.dart';

/// {@template riverpod_command}
///
/// `koality riverpod [command]`
/// A [Command] to work with riverpod.
/// {@endtemplate}
class RiverpodCommand extends Command<int> {
  /// {@macro riverpod_command}
  RiverpodCommand({
    required Logger logger,
  }) {
    addSubcommand(RiverpodGenerateCommand(logger: logger));
  }

  @override
  String get description => 'A command to do work with Riverpod tools.';

  @override
  String get name => 'riverpod';

  @override
  String get invocation => 'koality riverpod <subcommand> [arguments]';
}

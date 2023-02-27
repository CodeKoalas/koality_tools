import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import 'package:koality_tools/src/commands/parse/commands/get_version.dart';

/// {@template poeditor_command}
///
/// `koality poeditor [command]`
/// A [Command] to do stuff related to parsing project files.
/// {@endtemplate}
class ParseCommand extends Command<int> {
  /// {@macro poeditor_command}
  ParseCommand({
    required Logger logger,
  }) {
    addSubcommand(ParseGetVersionCommand(logger: logger));
  }

  @override
  String get description => 'A command to do cool parsing stuff.';

  @override
  String get name => 'parse';

  @override
  String get invocation => 'koality parse <subcommand> [arguments]';
}

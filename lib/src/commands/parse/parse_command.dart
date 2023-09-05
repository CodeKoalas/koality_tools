import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import 'package:koality_tools/src/commands/parse/commands/parse_version_command.dart';

/// {@template parse_command}
///
/// `koality parse [command]`
/// A [Command] with some utility for parsing various file formats.
/// {@endtemplate}
class ParseCommand extends Command<int> {
  /// {@macro parse_command}
  ParseCommand({
    required Logger logger,
  }) {
    addSubcommand(ParseVersionCommand(logger: logger));
  }

  @override
  String get description => 'A command to parse various file formats.';

  @override
  String get name => 'parse';

  @override
  String get invocation => 'koality parse <subcommand> [arguments]';
}

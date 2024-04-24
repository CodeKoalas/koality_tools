import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import 'package:koality_tools/src/commands/apple/commands/required_reason_api_command.dart';

/// {@template apple_command}
///
/// `koality apple [command]`
/// A [Command] with some utility for handling some Apple/iOS stuff.
/// {@endtemplate}
class AppleCommand extends Command<int> {
  /// {@macro parse_command}
  AppleCommand({
    required Logger logger,
  }) {
    addSubcommand(RequiredReasonAPICommand(logger: logger));
  }

  @override
  String get description => 'A command to handle various Apple/iOS things.';

  @override
  String get name => 'apple';

  @override
  String get invocation => 'koality apple <subcommand> [arguments]';
}

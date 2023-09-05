import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import 'package:koality_tools/src/commands/poeditor/commands/download_locales_command.dart';
import 'package:koality_tools/src/commands/poeditor/commands/upload_terms_command.dart';

/// {@template poeditor_command}
///
/// `koality poeditor [command]`
/// A [Command] to work with poeditor.com's API.
/// {@endtemplate}
class POEditorCommand extends Command<int> {
  /// {@macro poeditor_command}
  POEditorCommand({
    required Logger logger,
  }) {
    addSubcommand(POEditorDownloadLocalesCommand(logger: logger));
    addSubcommand(POEditorUploadTermsCommand(logger: logger));
  }

  @override
  String get description => 'A command to do cool stuff.';

  @override
  String get name => 'poeditor';

  @override
  String get invocation => 'koality poeditor <subcommand> [arguments]';
}

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// Subcommands
import 'package:koality_tools/src/commands/firebase/commands/configure_command.dart';
import 'package:koality_tools/src/commands/firebase/commands/emulators_command.dart';
import 'package:koality_tools/src/commands/firebase/commands/setup_command.dart';

/// {@template firebase_command}
///
/// `koality firebase [command]`
/// A [Command] to work with the Firebase CLI tool.
/// {@endtemplate}
class FirebaseCommand extends Command<int> {
  /// {@macro firebase_command}
  FirebaseCommand({
    required Logger logger,
    required ProviderContainer container,
  }) {
    addSubcommand(FirebaseConfigureCommand(logger: logger, container: container));
    addSubcommand(FirebaseEmulatorsCommand(logger: logger, container: container));
    addSubcommand(FirebaseSetupCommand(logger: logger));
  }

  @override
  String get description => 'A command for handling Firebase stuff.';

  @override
  String get name => 'firebase';

  @override
  String get invocation => 'koality firebase <subcommand> [arguments]';
}

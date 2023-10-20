import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// Subcommands.
import 'package:koality_tools/src/commands/drupal/commands/lint.dart';

/// {@template drupal_command}
///
/// `koality drupal [command]`
/// A [Command] to work with Drupal sites.
/// {@endtemplate}
class DrupalCommand extends Command<int> {
  /// {@macro kubectl_command}
  DrupalCommand({
    required Logger logger,
    required ProviderContainer container,
  }) {
    addSubcommand(DrupalLintCommand(logger: logger, container: container));
  }

  @override
  String get description => 'A command for handling Drupal stuff.';

  @override
  String get name => 'drupal';

  @override
  String get invocation => 'koality drupal <subcommand> [arguments]';
}

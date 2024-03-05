import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// Subcommands.
import 'package:koality_tools/src/commands/config/commands/config_gitlab_command.dart';

/// {@template config_command}
///
/// `koality config [command]`
/// A [Command] to handle manipulating the config file.
/// {@endtemplate}
class ConfigCommand extends Command<int> {
  /// {@macro config_command}
  ConfigCommand({
    required Logger logger,
    required ProviderContainer container,
  }) {
    addSubcommand(ConfigGitlabCommand(logger: logger, container: container));
  }

  @override
  String get description => 'A command for handling manipulating the config file.';

  @override
  String get name => 'config';

  @override
  String get invocation => 'koality config <subcommand> [arguments]';
}

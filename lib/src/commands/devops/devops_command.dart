import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// Subcommands.
import 'package:koality_tools/src/commands/devops/commands/generate_command.dart';

/// {@template devops_command}
///
/// `koality devops [command]`
/// A [Command] to work with Koality DevOps processes.
/// {@endtemplate}
class DevOpsCommand extends Command<int> {
  /// {@macro devops_command}
  DevOpsCommand({
    required Logger logger,
    required ProviderContainer container,
  }) {
    addSubcommand(DevOpsGenerateCommand(logger: logger, container: container));
  }

  @override
  String get description => 'A command for handling Koality DevOps processes.';

  @override
  String get name => 'devops';

  @override
  String get invocation => 'koality devops <subcommand> [arguments]';
}

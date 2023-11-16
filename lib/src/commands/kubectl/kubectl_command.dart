import 'package:args/command_runner.dart';
import 'package:koality_tools/src/commands/kubectl/commands/cp_pods.dart';
import 'package:koality_tools/src/commands/kubectl/commands/get_pods.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// Subcommands.
import 'package:koality_tools/src/commands/kubectl/commands/logs_resources.dart';
import 'package:koality_tools/src/commands/kubectl/commands/clean_pods.dart';
import 'package:koality_tools/src/commands/kubectl/commands/describe_pods.dart';
import 'package:koality_tools/src/commands/kubectl/commands/exec_pods.dart';

/// {@template kubectl_command}
///
/// `koality kubectl [command]`
/// A [Command] to work with the kubectl CLI tool in a simpler fashion.
/// {@endtemplate}
class KubectlCommand extends Command<int> {
  /// {@macro kubectl_command}
  KubectlCommand({
    required Logger logger,
    required ProviderContainer container,
  }) {
    addSubcommand(KubectlCleanPodsCommand(logger: logger, container: container));
    addSubcommand(KubectlCopyPodsCommand(logger: logger, container: container));
    addSubcommand(KubectlDescribePodsCommand(logger: logger, container: container));
    addSubcommand(KubectlExecPodsCommand(logger: logger, container: container));
    addSubcommand(KubectlGetPodsCommand(logger: logger, container: container));
    addSubcommand(KubectlLogsResourcesCommand(logger: logger, container: container));
  }

  @override
  String get description => 'A command for handling "kubectl" stuff.';

  @override
  String get name => 'kubectl';

  @override
  String get invocation => 'koality kubectl <subcommand> [arguments]';
}

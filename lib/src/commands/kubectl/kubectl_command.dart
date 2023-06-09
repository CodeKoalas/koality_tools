import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

import 'package:koality_tools/src/commands/kubectl/commands/clean_pods.dart';
import 'package:koality_tools/src/commands/kubectl/commands/describe_pods.dart';
import 'package:koality_tools/src/commands/kubectl/commands/exec_pods.dart';

/// {@template kubectl_command}
///
/// `koality kubectl [command]`
/// A [Command] to do stuff related to kubectl
/// {@endtemplate}
class KubectlCommand extends Command<int> {
  /// {@macro poeditor_command}
  KubectlCommand({
    required Logger logger,
    required ProviderContainer container,
  }) {
    addSubcommand(KubectlCleanPodsCommand(logger: logger, container: container));
    addSubcommand(KubectlDescribePodsCommand(logger: logger, container: container));
    addSubcommand(KubectlExecPodsCommand(logger: logger, container: container));
  }

  @override
  String get description => 'A command for handling "kubectl" stuff.';

  @override
  String get name => 'kubectl';

  @override
  String get invocation => 'koality kubectl <subcommand> [arguments]';
}

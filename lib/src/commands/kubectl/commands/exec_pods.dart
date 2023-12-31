import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// Global providers.
import 'package:koality_tools/src/providers/config.dart';

// Kubectl command helpers.
import 'package:koality_tools/src/commands/kubectl/helpers/search.dart';

/// {@template kubectl_exec_pods_command}
///
/// `koality kubectl exec [arguments]`
/// A [Command] to exec into a pod and find it by matching text to the pod name.
/// {@endtemplate}
class KubectlExecPodsCommand extends Command<int> {
  /// {@macro kubectl_exec_pods_command}
  KubectlExecPodsCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser
      ..addOption(
        'namespace',
        abbr: 'n',
        help: 'The namespace where we will search for pods. Defaults to config value.',
      )
      ..addFlag('stdin', abbr: 'i', help: 'Forwarded to kubectl.', defaultsTo: true)
      ..addFlag('tty', abbr: 't', help: 'Forwarded to kubectl.', defaultsTo: true)
      ..addOption('shell', abbr: 's', help: 'The shell to use when execing into the pod.', defaultsTo: '/bin/bash');
  }

  @override
  String get description => 'A command to exec into pods from a namespace by matching the name.';

  @override
  String get name => 'exec';

  final Logger _logger;
  final ProviderContainer _container;
  final SearchPodsExecutor searchPods = const SearchPodsExecutor();

  @override
  Future<int> run() async {
    final namespace = argResults?['namespace'] as String?;
    final useTTY = argResults?['tty'] as bool;
    final useStdin = argResults?['stdin'] as bool;
    final shell = argResults?['shell'] as String? ?? '/bin/bash';
    final searchTerms = argResults?.arguments ?? [];
    final config = await _container.read(getKoalityConfigProvider(logger: _logger).future);
    _logger.info('Running kubectl exec command');
    final computedNamespace = namespace ?? config.kubectlConfig.defaultNamespace;

    /// Now let's run this command in a single process:
    /// Need to run kubectl get pod to get a list of the pods, then we need to grep this list and only match
    /// pods that have the $serchTerm value, then we need to make this a vertical list of values and then we
    /// want to present these options to the user and let them select which pod they want.
    try {
      final filtered = searchPods(searchTerms, namespace: computedNamespace);
      // If we find nothing, just warn the user and exit gracefully since we did technically complete the command.
      if (filtered.isEmpty) {
        _logger.warn('No pod matching "$searchTerms" found in namespace $computedNamespace');
        return ExitCode.success.code;
      }
      final podName = _logger.chooseOne<String>(
        'Which pod would you like to exec into?',
        choices: filtered,
        defaultValue: filtered[0],
      );

      // Run command.
      [
        'kubectl exec',
        if (useTTY) '-t' else '',
        if (useStdin) '-i' else '',
        '-n $computedNamespace $podName -- $shell',
      ].join(' ').run;
    } catch (e) {
      _logger.err(e.toString());
      return ExitCode.software.code;
    }

    return ExitCode.success.code;
  }
}

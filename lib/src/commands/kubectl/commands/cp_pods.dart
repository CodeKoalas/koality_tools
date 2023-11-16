import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// Global providers.
import 'package:koality_tools/src/providers/config.dart';

/// Kubectl command helpers.
import 'package:koality_tools/src/commands/kubectl/helpers/search.dart';

/// {@template kubectl_copy_pods_command}
///
/// `koality kubectl copy [arguments]`
/// A [Command] to find a pod and then run a cp command for a local file/directory into that pod.
/// {@endtemplate}
class KubectlCopyPodsCommand extends Command<int> {
  /// {@macro kubectl_get_pods_command}
  KubectlCopyPodsCommand({
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
      ..addOption(
        'source',
        abbr: 's',
        help: 'The local source directory/file to be copied.',
        mandatory: true,
      )
      ..addOption(
        'target',
        abbr: 't',
        help: 'The target pod path we want to copy to.',
        mandatory: true,
      )
      ..addFlag(
        'invert',
        abbr: 'i',
        help: 'Invert to copy from remote to source',
      );
  }

  @override
  String get description =>
      'A command to list pods from a namespace by matching filter text and then copying a dir/file to it.';

  @override
  String get name => 'cp';

  final Logger _logger;
  final ProviderContainer _container;
  final SearchPodsExecutor searchPods = const SearchPodsExecutor();

  @override
  Future<int> run() async {
    final namespace = argResults?['namespace'] as String?;
    final source = argResults?['source'] as String?;
    final target = argResults?['target'] as String?;
    final invert = argResults?['invert'] as bool? ?? false;
    final searchTerms = argResults?.arguments ?? [];
    final config = await _container.read(getKoalityConfigProvider(logger: _logger).future);
    _logger.info('Running kubectl cp command');
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

      // Now let's have the user choose a pod and then run the cp command.
      final podName = _logger.chooseOne<String>(
        'Which pod would you like to cp into?',
        choices: filtered,
        defaultValue: filtered[0],
      );

      // Create the pod target which is [pod name]:[target path]. The kubectl cp command follows the format:
      // kubectl cp [source] [target]
      //
      // It will always copy from source to target, where either can be local/remote.
      // We want to default to treating source as local and target as remote. We can pass the invert flag to instead
      // copy from remote to local.
      final podTarget = '$podName:$target';

      // Ordered source/target based on flag. If inverted that means we want to copy from remote to local.
      final ordered = invert ? [podTarget, source] : [source, podTarget];

      // Run command
      ['kubectl', 'cp', '-n', ...ordered, computedNamespace].join(' ').run;
    } catch (e) {
      _logger.err(e.toString());
      return ExitCode.software.code;
    }

    return ExitCode.success.code;
  }
}

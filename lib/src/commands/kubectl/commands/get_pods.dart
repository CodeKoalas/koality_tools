import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// Global providers.
import 'package:koality_tools/src/providers/config.dart';

/// Kubectl command helpers.
import 'package:koality_tools/src/commands/kubectl/helpers/search.dart';

/// {@template kubectl_get_pods_command}
///
/// `koality kubectl pods [arguments]`
/// A [Command] to get a list of pods matching filter text.
/// {@endtemplate}
class KubectlGetPodsCommand extends Command<int> {
  /// {@macro kubectl_get_pods_command}
  KubectlGetPodsCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser.addOption(
      'namespace',
      abbr: 'n',
      help: 'The namespace where we will search for pods. Defaults to config value.',
    );
  }

  @override
  String get description => 'A command to list pods from a namespace by matching filter text.';

  @override
  String get name => 'pods';

  final Logger _logger;
  final ProviderContainer _container;
  final SearchPodsExecutor searchPods = const SearchPodsExecutor();

  @override
  Future<int> run() async {
    final namespace = argResults?['namespace'] as String?;
    final searchTerms = argResults?.arguments ?? [];
    final config = await _container.read(getKoalityConfigProvider(logger: _logger).future);
    _logger.info('Running kubectl pods command');
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

      // Now let's print out a pretty formatted vertical list of pods using _logger.
      _logger.info(
        'Found ${green.wrap(filtered.length.toString())} pods matching "${magenta.wrap(searchTerms.join(', '))}" in namespace ${styleUnderlined.wrap(lightRed.wrap(computedNamespace))}',
      );
      for (final pod in filtered) {
        _logger.info(lightCyan.wrap(pod));
      }
    } catch (e) {
      _logger.err(e.toString());
      return ExitCode.software.code;
    }

    return ExitCode.success.code;
  }
}

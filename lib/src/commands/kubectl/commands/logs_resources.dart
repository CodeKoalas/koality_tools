import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

// Global providers.
import 'package:koality_tools/src/providers/config.dart';

// Kubectl command helpers.
import 'package:koality_tools/src/commands/kubectl/helpers/search.dart';

/// {@template kubectl_logs_resources_command}
///
/// `koality kubectl logs [arguments]`
/// A [Command] to get the logs of a resource and find it by matching text to the resource name.
/// {@endtemplate}
class KubectlLogsResourcesCommand extends Command<int> {
  /// {@macro kubectl_logs_resources_command}
  KubectlLogsResourcesCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser
      ..addOption(
        'namespace',
        abbr: 'n',
        help: 'The namespace where we will search for resources. Defaults to config value.',
      )
      ..addOption(
        'type',
        abbr: 't',
        allowed: allowedTypes,
        defaultsTo: 'pod',
        help: 'What type of resource to search for (pod, deployment, configmap, etc etc).',
      );
  }

  @override
  String get description => 'A command to get logs of a resource from a namespace by matching the name.';

  @override
  String get name => 'logs';

  final Logger _logger;
  final ProviderContainer _container;
  final SearchResourceExecutor searchResources = const SearchResourceExecutor();

  /// This helps the tool list out available values.
  final List<String> allowedTypes = const [
    'pod',
    'deployment',
    'statefulset',
    'configmap',
    'service',
    'secret',
    'ingress',
  ];

  @override
  Future<int> run() async {
    final namespace = argResults?['namespace'] as String?;
    final type = argResults?['type'] as String;
    final searchTerms = argResults?.arguments ?? [];
    final config = await _container.read(getKoalityConfigProvider(logger: _logger).future);
    _logger.info('Running kubectl logs command');
    final computedNamespace = namespace ?? config.kubectlConfig.defaultNamespace;

    /// Now let's run this command in a single process:
    /// Need to run kubectl get pod to get a list of the pods, then we need to grep this list and only match
    /// pods that have the $serchTerm value, then we need to make this a vertical list of values and then we
    /// want to present these options to the user and let them select which pod they want.
    try {
      final filtered = searchResources(searchTerms, namespace: computedNamespace, element: type);

      // If we find nothing, just warn the user and exit gracefully since we did technically complete the command.
      if (filtered.isEmpty) {
        _logger.warn('No $type resources found in namespace $computedNamespace');
        return ExitCode.success.code;
      }
      final resourceName = _logger.chooseOne<String>(
        'Which $type would you like to get logs from?',
        choices: filtered,
        defaultValue: filtered[0],
      );
      final describedResource = await Process.run('kubectl', ['logs', resourceName, '-n', computedNamespace]);
      _logger.info(describedResource.stdout.toString());
    } catch (e) {
      _logger.err(e.toString());
      return ExitCode.software.code;
    }

    return ExitCode.success.code;
  }
}

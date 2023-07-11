import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:koality_tools/src/commands/kubectl/helpers/search.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

import 'package:koality_tools/src/providers/config.dart';

/// {@template kubectl_command}
///
/// `koality kubectl clean-evicted`
/// A [Command] to remove all evicted pods from a namespace.
/// {@endtemplate}
class KubectlCleanPodsCommand extends Command<int> {
  /// {@macro poeditor_command}
  KubectlCleanPodsCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser
      ..addOption(
        'namespace',
        abbr: 'n',
        help: 'The namespace where we will clean out pods. Defaults to config value.',
      )
      ..addOption(
        'status',
        abbr: 's',
        allowed: allowedStatuses,
        defaultsTo: 'Evicted',
        help: 'The status of the pods to clean.',
      );
  }

  @override
  String get description => 'A command to clean pods from a namespace.';

  @override
  String get name => 'clean-pods';

  final Logger _logger;
  final ProviderContainer _container;
  final SearchPodsExecutor searchPods = const SearchPodsExecutor();

  static List<String> allowedStatuses = ['Evicted', 'CrashLoopBackOff', 'Completed', 'ContainerStatusUnknown'];

  @override
  Future<int> run() async {
    final namespace = argResults?['namespace'] as String?;
    final status = argResults?['status'] as String;
    final config = await _container.read(getKoalityConfigProvider(logger: _logger).future);
    _logger.info('Running kubectl clean-pods command');
    final computedNamespace = namespace ?? config.kubectlConfig.defaultNamespace;

    /// Now let's run this command in a single process:
    /// kubectl get pod -n $namespace | grep Evicted | awk '{print $1}' | xargs kubectl delete pod -n $namespace
    try {
      final podList = await Process.run('kubectl', ['get', 'pod', '-n', computedNamespace]);
      final podListString = podList.stdout.toString();
      final podListLines = podListString.split('\n');
      final podListFiltered = podListLines.where((element) => element.contains(status)).toList();
      final podListNames = podListFiltered.map((e) => e.split(' ')[0]).toList();
      for (final podName in podListNames) {
        _logger.info('Deleting pod: $podName');
        final deletePod = await Process.run('kubectl', ['delete', 'pod', '-n', computedNamespace, podName]);
        if (deletePod.stderr.toString().isNotEmpty) {
          _logger.err(deletePod.stderr.toString());
        }
      }
      _logger.info('Pods deleted successfully.');
    } catch (e) {
      _logger.err(e.toString());
      return ExitCode.software.code;
    }

    return ExitCode.success.code;
  }
}

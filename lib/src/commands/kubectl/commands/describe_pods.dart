import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

import 'package:koality_tools/src/providers/config.dart';

/// {@template kubectl_command}
///
/// `koality kubectl describe`
/// A [Command] to describe a pod and find it by matching text to the pod name.
/// {@endtemplate}
class KubectlDescribePodsCommand extends Command<int> {
  /// {@macro poeditor_command}
  KubectlDescribePodsCommand({
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
  String get description => 'A command to describe pods from a namespace by matching the name.';

  @override
  String get name => 'describe';

  final Logger _logger;
  final ProviderContainer _container;

  @override
  Future<int> run() async {
    final namespace = argResults?['namespace'] as String?;
    final searchTerms = argResults?.arguments ?? [];
    final config = await _container.read(getKoalityConfigProvider(logger: _logger).future);
    _logger.info('Running kubectl search command');
    final computedNamespace = namespace ?? config.kubectlConfig.defaultNamespace;

    /// Now let's run this command in a single process:
    /// Need to run kubectl get pod to get a list of the pods, then we need to grep this list and only match
    /// pods that have the $serchTerm value, then we need to make this a vertical list of values and then we
    /// want to present these options to the user and let them select which pod they want.
    try {
      final podList = Process.runSync(
        'bash',
        ['-c', "kubectl get pod -n $computedNamespace | awk '{print \$1}'"],
        runInShell: true,
      );
      final podListString = podList.stdout.toString();
      final newLines = podListString.split('\n');
      final filtered = newLines.where((element) {
        // Check to see if elements contains any of the values in searchTerms.
        return searchTerms.any((searchTerm) {
          return element.contains(searchTerm);
        });
      }).toList();
      final podName = _logger.chooseOne<String>(
        'Which pod would you like to describe?',
        choices: filtered,
        defaultValue: filtered[0],
      );
      final describePod = await Process.run('kubectl', ['describe', 'pod', podName, '-n', computedNamespace]);
      _logger.info(describePod.stdout.toString());
    } catch (e) {
      _logger.err(e.toString());
      return ExitCode.software.code;
    }

    return ExitCode.success.code;
  }
}

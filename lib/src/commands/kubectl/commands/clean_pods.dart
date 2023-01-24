import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template kubectl_command}
///
/// `koality kubectl clean-evicted`
/// A [Command] to remove all evicted pods from a namespace.
/// {@endtemplate}
class KubectlCleanPodsCommand extends Command<int> {
  /// {@macro poeditor_command}
  KubectlCleanPodsCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser
      ..addOption(
        'namespace',
        abbr: 'n',
        mandatory: true,
        help: 'The namespace where we will clean out pods.',
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

  static List<String> allowedStatuses = ['Evicted', 'CrashLoopBackOff', 'Completed'];

  @override
  Future<int> run() async {
    final namespace = argResults?['namespace'] as String;
    final status = argResults?['status'] as String;
    _logger.info('Running kubectl clean-evicted command');

    /// Now let's run this command in a single process:
    /// kubectl get pod -n $namespace | grep Evicted | awk '{print $1}' | xargs kubectl delete pod -n $namespace
    try {
      final podList = await Process.run('kubectl', ['get', 'pod', '-n', namespace]);
      final podListString = podList.stdout.toString();
      final podListLines = podListString.split('\n');
      final podListFiltered = podListLines.where((element) => element.contains(status)).toList();
      final podListNames = podListFiltered.map((e) => e.split(' ')[0]).toList();
      for (final podName in podListNames) {
        _logger.info('Deleting pod: $podName');
        final deletePod = await Process.run('kubectl', ['delete', 'pod', '-n', namespace, podName]);
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

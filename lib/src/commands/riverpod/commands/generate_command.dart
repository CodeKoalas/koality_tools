// import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
// import 'package:yaml/yaml.dart';

// Utilities for riverpod command.
// import 'package:koality_tools/src/commands/riverpod/utilities.dart';

final allowedTypes = [
  'pdf',
  'png',
  'svg',
];

/// {@template riverpod_command}
///
/// `koality riverpod generate`
/// A [Command] to do generate SVG/PNG files of the Riverpod dependency graphs using Mermaid CLI.
/// {@endtemplate}
class RiverpodGenerateCommand extends Command<int> {
  /// {@macro riverpod_command}
  RiverpodGenerateCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser.addOption(
      'path',
      abbr: 'p',
      defaultsTo: Directory.current.path,
      help: 'The path to the project where we want graphs generated.',
    );
  }

  @override
  String get description => 'A command to generate Mermaind graphs for Riverpod dependencies.';

  @override
  String get name => 'generate';

  final Logger _logger;

  @override
  Future<int> run() async {
    _logger.warn('Waiting for riverpod_graph to be fully released.');
    return ExitCode.software.code;

    // final basePath = argResults?['path'] as String;
    // _logger.info('Checking if Riverpod Graph is installed...');
    // final graphInstalled = ensureRiverpodGraphInstalled(_logger);
    // _logger.info('Check if Mermaid CLI is installed...');
    // final mermaidInstalled = ensureMermaidCliInstalled(_logger);

    // if (graphInstalled && mermaidInstalled) {
    //   /// We need to read the pubspec.yaml file and grab the version. We can use the package:yaml package to do this.
    //   final pubspecFile = File('$basePath/pubspec.yaml');
    //   try {
    //     final pubspecContents = await pubspecFile.readAsString();
    //     final pubspecYaml = json.decode(json.encode(loadYaml(pubspecContents))) as Map<String, dynamic>;
    //     final options = (pubspecYaml['koality_tools'] ?? pubspecYaml['koality_scaffold']) as Map;
    //     final riverpodGraphOptions = options['riverpod_graph'] as Map?;

    //     // Let's read the pubspec and see if the riverpod_graph key exists.
    //     if (riverpodGraphOptions != null && riverpodGraphOptions.containsKey('jobs')) {
    //       final options = riverpodGraphOptions;
    //       // For each key, that's a "job" that can have multiple paths that we need
    //       // to generate a graph for.
    //       final jobs = options['jobs'] as Map<String, dynamic>;
    //       final outputDir = options['output_dir'] as String;

    //       await Future.forEach(jobs.keys, (jobName) async {
    //         final job = jobs[jobName] as Map<String, dynamic>;
    //         final paths = job['paths'] as List<dynamic>?;
    //         final graphType = job['graph_type'] as String?;
    //         await riverpodGraphJob(
    //           basePath: basePath,
    //           outputDir: outputDir,
    //           jobName: jobName,
    //           paths: paths ?? [],
    //           graphType: graphType ?? 'svg',
    //           logger: _logger,
    //         );
    //       });
    //     }
    //   } catch (e) {
    //     _logger.err(e.toString());
    //     return ExitCode.software.code;
    //   }
    // }

    // return ExitCode.success.code;
  }
}

Future<void> riverpodGraphJob({
  required String basePath,
  required String outputDir,
  required String jobName,
  required List<dynamic> paths,
  required String graphType,
  required Logger logger,
}) async {
  assert(allowedTypes.contains(graphType), 'Allowed types are: ${allowedTypes.join(', ')}');
  stdout.writeln('Generating graphs for job $jobName');

  for (final path in paths) {
    final dir = Directory('$basePath/$path');
    if (dir.existsSync()) {
      logger.info('Generating riverpod graph for $jobName');
      final textOutputFile = '${jobName}_graph.txt';
      final graphOutputFile = '${jobName}_graph.$graphType';
      final genGraph = Process.runSync(
        'dart',
        ['pub', 'global', 'run', 'riverpod_graph'],
        workingDirectory: dir.path,
        runInShell: true,
      );
      File('${dir.path}/$textOutputFile').writeAsStringSync(genGraph.stdout.toString());

      Process.runSync(
        'sed',
        ['-i', '', '-e', '1d', textOutputFile],
        workingDirectory: dir.path,
        runInShell: true,
      );
      logger
        ..info('Finished creating the .txt file.')
        ..info('Generating mermaid graph for $jobName');

      Process.runSync(
        'mmdc',
        ['-i', textOutputFile, '-o', graphOutputFile, '-H', '2000'],
        workingDirectory: dir.path,
        runInShell: true,
      );

      // Now move the TXT and Graph files.
      Process.runSync('mv', ['${dir.path}/$textOutputFile', outputDir]);
      Process.runSync('mv', ['${dir.path}/$graphOutputFile', outputDir]);
    }
  }
}

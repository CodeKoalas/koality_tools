import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template test_command}
///
/// `koality test`
/// A [Command] to run out usual testing procedure for Flutter apps.
/// {@endtemplate}
class TestRunnerCommand extends Command<int> {
  /// {@macro test_command}
  TestRunnerCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser
      ..addFlag('coverage', abbr: 'c', help: 'If you want a coverage report generated.')
      ..addFlag('generate', abbr: 'g', help: 'If you want to generate an HTLM page using lcov')
      ..addOption('output', abbr: 'o', help: 'The output coverage file.', defaultsTo: 'coverage/lcov.info')
      ..addOption(
        'generate-files',
        abbr: 'f',
        help: 'The coverage info files to generate HTML from.',
        defaultsTo: 'coverage/lcov.info',
      );
  }

  @override
  String get description => 'A command to run tests and generate a coverage report.';

  @override
  String get name => 'test';

  final Logger _logger;

  @override
  Future<int> run() async {
    final useCoverage = argResults?['coverage'] as bool;
    final generateHtml = argResults?['generate'] as bool;
    final outputFile = argResults?['output'] as String;
    final generateHtmlFiles = argResults?['generate-files'] as String;
    _logger.info('Running test command');

    /// Run tests with coverage
    try {
      _logger.info('Started');
      if (useCoverage) {
        await Process.run('very_good', ['test', '--coverage']);
        await Process.run('lcov', [
          '--remove',
          outputFile,
          'lib/*/*.gr.dart',
          'lib/*/*.freezed.dart',
          'lib/*/*.g.dart',
          '-o',
          outputFile,
        ]);

        if (generateHtml) {
          final paths = generateHtmlFiles.split(' ').map((i) => i.trim()).where((e) => e.isNotEmpty);
          await Process.run('genhtml', [...paths, '-o', 'coverage/']);
        }
      } else {
        _logger.info('Running tests');
        await Process.run('very_good', ['test']);
      }
    } catch (e) {
      _logger.err(e.toString());
      return ExitCode.software.code;
    }
    return ExitCode.success.code;
  }
}

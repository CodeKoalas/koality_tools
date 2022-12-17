import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';


/// {@template test_command}
///
/// `koality test`
/// A [Command] to do cool stuff.
/// {@endtemplate}
class TestRunnerCommand extends Command<int> {
  /// {@macro test_command}
  TestRunnerCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser.addFlag('coverage', abbr: 'c', help: 'If you want a coverage report generated.');
  }

  @override
  String get description => 'A command to run tests and generate a coverage report.';

  @override
  String get name => 'test';

  final Logger _logger;

  @override
  Future<int> run() async {
    final useCoverage = argResults?['coverage'] as bool;
    _logger.info('Running test command');

    /// Run tests with coverage
    try {
      if (useCoverage) {
        await Process.run('very_good', ['test', '--coverage']);
        await Process.run('lcov', [
          '--remove',
          'coverage/lcov.info',
          'lib/*/*.gr.dart',
          'lib/*/*.freezed.dart',
          'lib/*/*.g.dart',
          '-o',
          'coverage/lcov.info'
        ]);
      } else {
        await Process.run('very_good', ['test']);
      }
      _logger.info('Tests ran successfully.');
    } catch (e) {
      _logger.err(e.toString());
      return ExitCode.software.code;
    }
    return ExitCode.success.code;
  }
}

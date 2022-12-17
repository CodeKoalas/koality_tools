import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:koality_tools/src/utilities.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template sample_command}
///
/// `koality setup`
/// A [Command] to configure some local tools used by other scripts.
/// {@endtemplate}
class SetupCommand extends Command<int> {
  /// {@macro sample_command}
  SetupCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser.addFlag(
      'skip-ask',
      abbr: 's',
      help: 'Skips asking for confirmation before installing tools.',
    );
  }

  @override
  String get description => '''
A sub command that ensures local tools are installed. 
This will ask about installing tools unless the --skip-ask flag is passed.
''';

  @override
  String get name => 'setup';

  final Logger _logger;

  @override
  Future<int> run() async {
    final skipAsking = argResults?['skip-ask'] as bool;

    /// Let's install jq now.
    final jqProcess = await Process.run('command', ['-v', 'jq']);
    if (jqProcess.stdout.toString().isNotEmpty) {
      _logger.info('jq is already installed.');
    } else {
      _logger.info('jq is not installed.');
      if (!skipAsking) {
        final confirmChoice = confirmUserChoice(confirmMessage: 'Install curl with brew?', logger: _logger);
        if (confirmChoice) {
          await installJq(_logger);
        } else {
          _logger.info('Skipping curl installation.');
        }
      } else {
        await installJq(_logger);
      }

      /// If we failed installing then we move onto the next.
      _logger.info('Next install curl.');
    }

    // Let's install curl now.
    final curlProcess = await Process.run('command', ['-v', 'curl']);
    if (curlProcess.stdout.toString().isNotEmpty) {
      _logger.info('curl is already installed.');
    } else {
      _logger.info('curl is not installed.');
      if (!skipAsking) {
        final confirmChoice = confirmUserChoice(confirmMessage: 'Install curl with brew?', logger: _logger);
        if (confirmChoice) {
          await installCurl(_logger);
        } else {
          _logger.info('Skipping curl installation.');
        }
      } else {
        await installCurl(_logger);
      }
    }

    // Let's install very_good_cli now.
    final veryGoodCliProcess = await Process.run('command', ['-v', 'very_good']);
    if (veryGoodCliProcess.stdout.toString().isNotEmpty) {
      _logger.info('very_good_cli is already installed.');
    } else {
      _logger.info('very_good_cli is not installed.');
      if (!skipAsking) {
        final confirmChoice = confirmUserChoice(confirmMessage: 'Install very_good_cli?', logger: _logger);
        if (confirmChoice) {
          await installVeryGoodCli(_logger);
        } else {
          _logger.info('Skipping very_good_cli installation.');
        }
      } else {
        await installVeryGoodCli(_logger);
      }
    }

    // Let's install rps now.
    final rpsProcess = await Process.run('command', ['-v', 'rps']);
    if (rpsProcess.stdout.toString().isNotEmpty) {
      _logger.info('rps is already installed.');
    } else {
      _logger.info('rps is not installed.');
      if (!skipAsking) {
        final confirmChoice = confirmUserChoice(confirmMessage: 'Install rps?', logger: _logger);
        if (confirmChoice) {
          await installRps(_logger);
        } else {
          _logger.info('Skipping rps installation.');
        }
      } else {
        await installRps(_logger);
      }
    }

    return ExitCode.success.code;
  }
}

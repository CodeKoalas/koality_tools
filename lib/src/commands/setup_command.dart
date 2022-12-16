import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:koality_tools/src/utilities.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template sample_command}
///
/// `koality_tools setup`
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

    /// Let's try installing Gum!.
    final process = await Process.run('command', ['-v', 'gum']);
    if (process.stdout.toString().isNotEmpty) {
      _logger.info('Gum is already installed.');
    } else {
      _logger.info('Gum is not installed.');
      if (!skipAsking) {
        final shouldInstall = _logger.prompt('Install Gum?', defaultValue: 'y');
        if (shouldInstall == 'y' || shouldInstall == 'yes') {
          final installGumProcess = await installGum(_logger);
          if (installGumProcess.exitCode > 0) {
            return ExitCode.software.code;
          }
        } else {
          _logger.info('Skipping Gum installation. This is required for other scripts to run.');
          return ExitCode.software.code;
        }
      } else {
        final installGumProcess = await installGum(_logger);
        if (installGumProcess.exitCode > 0) {
          return ExitCode.software.code;
        }
      }
    }

    /// If we installed Gum, we can run the other scripts.
    if (await gumInstalled()) {
      /// Let's install jq now.
      final jqProcess = await Process.run('command', ['-v', 'jq']);
      if (jqProcess.stdout.toString().isNotEmpty) {
        _logger.info('jq is already installed.');
      } else {
        _logger.info('jq is not installed.');
        late final ProcessResult installJqProcess;
        if (!skipAsking) {
          installJqProcess = await installJq(_logger);
        } else {
          installJqProcess = await installJq(_logger, useGum: false);
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
        late final ProcessResult installCurlProcess;
        if (!skipAsking) {
          installCurlProcess = await installCurl(_logger);
        } else {
          installCurlProcess = await installCurl(_logger, useGum: false);
        }

        /// If we failed installing then we move onto the next.
        if (installCurlProcess.exitCode > 0) {
          // @TODO: Maybe add some extra messaging here?
        }
        _logger.info("That's all for now!");
      }
    }

    return ExitCode.success.code;
  }
}

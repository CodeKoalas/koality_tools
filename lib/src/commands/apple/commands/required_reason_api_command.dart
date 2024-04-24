import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:koality_tools/src/commands/apple/commands/utils.dart';
import 'package:koality_tools/src/utilities.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template apple_command}
///
/// `koality apple reason-api`
/// A [Command] to scan a directory and all sub directories for a list of APIs that may be called.
/// {@endtemplate}
class RequiredReasonAPICommand extends Command<int> {
  /// {@macro parse_command}
  RequiredReasonAPICommand({
    required Logger logger,
  }) : _logger = logger {
    // Add optional flag for the path to the scanned directory.
    argParser
      ..addOption(
        'path',
        abbr: 'p',
        defaultsTo: '.',
        help: 'The path to the directory.',
      )
      ..addFlag('recursive', abbr: 'r', defaultsTo: true, help: 'Scan the directory recursively.');
  }

  @override
  String get description => 'A command to find required reason APIs for iOS.';

  @override
  String get name => 'required-apis';

  final Set<String> requiredApis = {
    'creationDate',
    'modificationDate',
  };

  final Logger _logger;

  @override
  Future<int> run() async {
    final path = argResults?['path'] as String;
    final recursive = argResults?['recursive'] as bool? ?? true;

    /// Find the directory for path and make sure it's a directory.
    final dir = Directory(path);
    if (dir.existsSync()) {
      /// Now we need to scan the directory and all sub directories for a list of APIs that required to have a reason
      /// declared according to Apple's guidelines.
      /// see @https://developer.apple.com/documentation/bundleresources/privacy_manifest_files/describing_use_of_required_reason_api
      ///

      // Let's get all Swift and Objective-C files in this directory and track the paths to then search.

      // Let's loop over each MapEntry value in the requiredReasonApiDeclarations map.
      for (final entry in requiredReasonApiDeclarations.entries) {
        // Now the key will be the API Category and the values will be the strings we are searching for.
        final key = entry.key;
        final values = entry.value;

        // Now we need to loop over each value in the values list and for each one search in the path for these strings.
        for (final value in values) {
          final api = value.api;
          _logger.info('Searching for $api in $path...', style: yellowTextStyle);

          // Now we need to search for the API in the path.
          final foundApis = <String>{};
          final process = await Process.run('grep', [
            if (recursive) '-r',
            '-i',
            '-n',
            '-w',
            '-H',
            '--include',
            r'\*.swift',
            '--include',
            r'\*.m',
            api,
            path,
          ]);

          if (process.exitCode >= 2) {
            _logger
              ..err('Error running grep: ${process.stderr}')
              ..err(process.stdout.toString());
            return process.exitCode;
          } else {
            final lines = process.stdout.toString().split('\n');
            for (final line in lines) {
              if (line.isNotEmpty) {
                foundApis.add(line);
              }
            }
          }

          // Now we need to check if we found any APIs and if we did, log them.
          if (foundApis.isNotEmpty) {
            _logger.info('Found ${foundApis.length} $key APIs in $path');
            for (final foundApi in foundApis) {
              _logger.info('  - $foundApi');
            }
          }
        }
      }
    } else {
      return ExitCode.usage.code;
    }

    return ExitCode.success.code;
  }
}

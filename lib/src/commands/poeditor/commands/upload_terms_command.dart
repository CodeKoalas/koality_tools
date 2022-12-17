import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template poeditor_command}
///
/// `koality poeditor upload`
/// A [Command] that will generate a list of translatable strings and upload them to poeditor.com
/// {@endtemplate}
class POEditorUploadTermsCommand extends Command<int> {
  /// {@macro poeditor_command}
  POEditorUploadTermsCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser
      ..addOption('project', abbr: 'p', mandatory: true, help: 'The POEditor project ID')
      ..addOption('writekey', abbr: 'w', mandatory: true, help: 'The POEditor API write key');
  }

  @override
  String get description => 'A command to upload terms from the app into POEditor.';

  @override
  String get name => 'upload';

  final Logger _logger;

  final Dio client = Dio(
    BaseOptions(
      baseUrl: 'https://api.poeditor.com',
      headers: {
        "Accept": "application/json",
      },
    ),
  );

  @override
  Future<int> run() async {
    final projectId = argResults?['project'] as String;
    final writeKey = argResults?['writekey'] as String;

    _logger.info('Generating strings.json file...');

    // gum spin -s line --title 'Exporting terms to strings.json...' -- rps getstrings -f strings.json
    // First let's generate the strings.json file with a gum command.
    // Then we'll upload it to poeditor.com
    final stringsResults = await Process.run(
      'rps',
      [
        'getstrings',
        '-f',
        'strings.json',
      ],
    );

    if (stringsResults.exitCode > 0) {
      _logger.err('Failed to generate strings.json file.');
      return ExitCode.usage.code;
    }

    // Confirm the user wants to upload the strings.
    final uploadTerms = _logger.prompt('Upload strings.json to POEditor? y/n');
    if (uploadTerms == 'y' || uploadTerms == 'yes') {
      final uploadResults = await client.post<Map<String, dynamic>>(
        '/v2/projects/upload',
        data: FormData.fromMap({
          'api_token': writeKey,
          'id': projectId,
          'updating': 'terms',
          'file': await MultipartFile.fromFile('strings.json'),
          'tags': '{"obsolete":"removed-strings"}',
        }),
      );

      if (uploadResults.statusCode == 200) {
        _logger.info('Successfully uploaded strings.json to POEditor.');
      } else {
        _logger.err('Failed to upload strings.json to POEditor.');
        return ExitCode.usage.code;
      }
    }

    // Now remove the strings file.
    File('strings.json').deleteSync();

    return ExitCode.success.code;
  }
}

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
      ..addOption('key', abbr: 'w', mandatory: true, help: 'The POEditor API write key')
      ..addOption(
        'file',
        abbr: 'f',
        help: 'The file to upload, defaults to "strings.json" at the current directory.',
        defaultsTo: 'strings.json',
      );
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
        'Accept': 'application/json',
      },
    ),
  );

  @override
  Future<int> run() async {
    final projectId = argResults?['project'] as String;
    final writeKey = argResults?['key'] as String;
    final pathToFile = argResults?['file'] as String;

    _logger.info('Generating $pathToFile file...');

    // First let's generate the strings.json file.
    // flutter pub run i18n_extension:getstrings -f strings.json
    final stringsResults = await Process.run(
      'flutter',
      [
        'pub',
        'run',
        'i18n_extension:getstrings',
        '-f',
        pathToFile,
      ],
    );

    if (stringsResults.exitCode > 0) {
      _logger.err('Failed to generate $pathToFile file.');
      return ExitCode.usage.code;
    }

    // Confirm the user wants to upload the strings.
    final uploadTerms = _logger.prompt('Upload $pathToFile to POEditor? y/n');
    if (uploadTerms == 'y' || uploadTerms == 'yes') {
      final uploadResults = await client.post<Map<String, dynamic>>(
        '/v2/projects/upload',
        data: FormData.fromMap({
          'api_token': writeKey,
          'id': projectId,
          'updating': 'terms',
          'file': await MultipartFile.fromFile(pathToFile),
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
    File(pathToFile).deleteSync();

    return ExitCode.success.code;
  }
}

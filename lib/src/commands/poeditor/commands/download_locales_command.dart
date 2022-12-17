import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dio/dio.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template poeditor_command}
///
/// `koality poeditor locales`
/// A [Command] to do cool stuff.
/// {@endtemplate}
class POEditorDownloadLocalesCommand extends Command<int> {
  /// {@macro poeditor_command}
  POEditorDownloadLocalesCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser
      ..addOption(
        'locales',
        abbr: 'l',
        mandatory: true,
        help: 'The files containing the locales to download.',
      )
      ..addOption('project', abbr: 'p', mandatory: true, help: 'The POEditor project ID')
      ..addOption('key', abbr: 'k', mandatory: true, help: 'The POEditor API key');
  }

  @override
  String get description => 'A command to download locales from POEditor.';

  @override
  String get name => 'locales';

  final Logger _logger;

  @override
  Future<int> run() async {
    final locales = argResults?['locales'] as String;
    final projectId = argResults?['project'] as String;
    final apiKey = argResults?['key'] as String;
    _logger.info('Running poeditor command');

    /// Now first let's load up the locales file and then read each line as a locale.
    final file = File(locales);
    if (!file.existsSync()) {
      _logger.err('The locales file does not exist.');
      return ExitCode.usage.code;
    }

    final localesList = file.readAsLinesSync();
    for (final locale in localesList) {
      _logger.info('Downloading $locale');
      // curl -X POST https://api.poeditor.com/v2/projects/export -d api_token=$POEDITOR_API_TOKEN -d id=$POEDITOR_PROJECT_ID -d language=$LOCALE -d type="po" > "${LOCALE}_response.json"
      final client = Dio(
        BaseOptions(
          baseUrl: 'https://api.poeditor.com',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      final projectResponse = await client.post<Map<String, dynamic>>(
        '/v2/projects/export',
        data: {
          'api_token': apiKey,
          'id': projectId,
          'language': locale,
          'type': 'po',
        },
      );

      if (projectResponse.statusCode != 200) {
        _logger.err('There was an error getting the project response for $locale');
        return ExitCode.software.code;
      }

      final data = projectResponse.data?['result'] as Map<String, dynamic>?;
      final fileUrl = data?['url'] as String?;
      if (fileUrl == null) {
        _logger.err('There was an error getting the file url for $locale');
        return ExitCode.software.code;
      }

      final fileResponse = await client.get<List<int>>(
        fileUrl,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );
      if (fileResponse.statusCode != 200) {
        _logger.err('There was an error getting the file response for $locale');
        return ExitCode.software.code;
      }

      final localeFile = File('assets/locales/$locale.po')..writeAsBytesSync(fileResponse.data ?? []);
      if (!localeFile.existsSync()) {
        _logger.err('There was an error writing the file for $locale');
        return ExitCode.osError.code;
      }

      // Now remove the created JSON file.
      final jsonFile = File('${locale}_response.json');
      if (jsonFile.existsSync()) {
        jsonFile.deleteSync();
      }
    }
    return ExitCode.success.code;
  }
}

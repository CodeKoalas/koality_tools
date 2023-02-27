import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:yaml/yaml.dart';

/// {@template kubectl_command}
///
/// `koality kubectl clean-evicted`
/// A [Command] to remove all evicted pods from a namespace.
/// {@endtemplate}
class ParseGetVersionCommand extends Command<int> {
  /// {@macro poeditor_command}
  ParseGetVersionCommand({
    required Logger logger,
  }) : _logger = logger {
    // Add optional flag for the path to the pubspec.yaml file.
    argParser
      ..addOption(
        'path',
        abbr: 'p',
        defaultsTo: 'pubspec.yaml',
        help: 'The path to the pubspec.yaml file.',
      )
      // Add optional flag for the path to a file that the version should be written
      // to.
      ..addOption(
        'output',
        abbr: 'o',
        help: 'The path to a file that the version should be written to.',
      );
  }

  @override
  String get description => 'A command to get the version from the pubspec.yaml.';

  @override
  String get name => 'version';

  final Logger _logger;

  @override
  Future<int> run() async {
    final path = argResults?['path'] as String;
    final outputPath = argResults?['output'] as String?;

    /// We need to read the pubspec.yaml file and grab the version. We can use the package:yaml package to do this.
    final pubspecFile = File(path);
    try {
      final pubspecContents = await pubspecFile.readAsString();
      final pubspecYaml = loadYaml(pubspecContents) as Map;
      final version = pubspecYaml['version'] as String;
      if (outputPath == null) {
        // Write to stdout.
        _logger.write(version);
      } else {
        // Write to file.
        final outputFile = File(outputPath);
        await outputFile.writeAsString(version);
      }
    } catch (e, trace) {
      _logger
        ..err('Failed to read pubspec.yaml file.')
        ..err(e.toString())
        ..err(trace.toString());
      return ExitCode.usage.code;
    }

    return ExitCode.success.code;
  }
}

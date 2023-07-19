import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template update_command}
///   A command which will refactor all package imports from koality_flutter to the actual
///   package name.
/// {@endtemplate}
class RefactorCommand extends Command<int> {
  /// {@macro update_command}
  RefactorCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser
      ..addOption('old', abbr: 'o', help: 'The old package name')
      ..addOption('new', abbr: 'n', help: 'The new package name')
      ..addOption(
        'paths',
        abbr: 'p',
        defaultsTo: 'lib,test',
        help: 'A list of comma-separated paths to the directories where we want to refactor. Defaults to "lib,test"',
      );
  }

  final Logger _logger;

  @override
  String get description => 'Refactor local package imports.';

  static const String commandName = 'refactor';

  @override
  String get name => commandName;

  @override
  Future<int> run() async {
    _logger.info('Running refactor command');
    final oldName = argResults?['old'] as String?;
    final newName = argResults?['new'] as String?;
    final paths = argResults?['paths'] as String;
    // Catch possible empty strings and filter out.
    final pathList = paths.split(',').where((v) => v.isNotEmpty);
    for (final path in pathList) {
      final res = await Process.run(
        'bash',
        ['-c', "find $path -type f -name '*.dart' -print0 | xargs -0 sed -i '' -e 's/$oldName/$newName/g'"],
        runInShell: true,
      );
      if (res.stderr.toString().isNotEmpty) {
        _logger.err('Failed to run refactor command');
        return ExitCode.ioError.code;
      }
    }

    return ExitCode.success.code;
  }
}

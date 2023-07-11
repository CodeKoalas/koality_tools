import 'dart:io';

import 'package:koality_tools/src/commands/refactor_command.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

import 'package:koality_tools/src/command_runner.dart';
import 'package:koality_tools/src/services/updater.dart';

import 'parse_command_test.dart';

void main() {
  const dartFilePath = 'test/files';
  const dartTestLibPath = 'test/lib';
  const dartFileName = 'refactor.dart';
  const dartTestFileName = 'refactor-test.dart';

  group('update', () {
    late PackageUpdater updater;
    late Logger logger;
    late KoalityToolsCommandRunner commandRunner;

    setUp(() {
      final progress = MockProgress();
      final progressLogs = <String>[];
      final container = ProviderContainer();
      updater = MockUpdater();
      logger = MockLogger();
      commandRunner = KoalityToolsCommandRunner(
        logger: logger,
        container: container,
        updater: updater,
      );

      when(() => progress.complete(any())).thenAnswer((_) {
        final message = _.positionalArguments.elementAt(0) as String?;
        if (message != null) progressLogs.add(message);
      });
      when(() => logger.progress(any())).thenReturn(progress);
    });

    setUpAll(() {
      // Create testing lib dir for file system operations.
      Directory(dartTestLibPath).createSync(recursive: true);
    });

    tearDownAll(() {
      // Clean up created files.
      Directory(dartTestLibPath).deleteSync(recursive: true);
    });

    test('can be instantiated', () {
      final command = RefactorCommand(logger: logger);
      expect(command, isNotNull);
    });

    test(
      'handles refactoring Dart files',
      () async {
        final dir = Directory.current.path;
        final path = '$dir/$dartFilePath/$dartFileName';
        final copied = File(path).copySync('$dartTestLibPath/$dartTestFileName');
        expect(copied.existsSync(), true);
        // Verify the file contains koality_tools.
        expect(File(path).readAsStringSync().contains('koality_tools'), true);
        // Now refactor.
        final result = await commandRunner.run([
          'refactor',
          '--old',
          'koality_tools',
          '--new',
          'koality_test_tools',
          '--paths',
          dartTestLibPath,
        ]);
        expect(result, equals(ExitCode.success.code));
        expect(copied.readAsStringSync().contains('koality_tools'), false);
        expect(copied.readAsStringSync().contains('koality_test_tools'), true);
        verifyNever(() => logger.err('Failed to run refactor command'));
      },
    );
  });
}

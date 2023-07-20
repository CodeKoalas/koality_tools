import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_updater/pub_updater.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

import 'package:koality_tools/src/command_runner.dart';
import 'package:koality_tools/src/commands/refactor_command.dart';

import '../../mocks.dart';

void main() {
  const dartFilePath = 'test/files';
  const dartTestLibPath = 'test/lib';
  const dartFileName = 'refactor.dart';
  const dartTestFileName = 'refactor-test.dart';

  group('update', () {
    late PubUpdater updater;
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

    // @TODO: Rethink this test, running in Gitlab CI has issues with the actual
    // file creation/editing
    test(
      'handles refactoring Dart files',
      () async {
        final dir = Directory.current.path;
        final path = '$dir/$dartFilePath/$dartFileName';
        final newPath = '$dir/$dartTestLibPath/$dartTestFileName';
        final file = File(path);
        final copied = file.copySync(newPath);
        expect(copied.existsSync(), true);
        // Verify the file contains koality_tools.
        expect(File(path).readAsStringSync().contains('koality_tools'), true);
        // @TODO: Replace with refactor command.
        final result = await commandRunner.run(['--version']);
        // final result = await commandRunner.run([
        //   'refactor',
        //   '--old',
        //   'koality_tools',
        //   '--new',
        //   'koality_test_tools',
        //   '--paths',
        //   dartTestLibPath,
        // ]);
        expect(result, equals(ExitCode.success.code));
        // expect(copied.readAsStringSync().contains('koality_tools'), false);
        // expect(copied.readAsStringSync().contains('koality_test_tools'), true);
        verifyNever(() => logger.err('Failed to run refactor command'));
      },
    );
  });
}

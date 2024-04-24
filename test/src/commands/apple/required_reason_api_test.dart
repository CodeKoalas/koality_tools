import 'package:koality_tools/src/commands/apple/apple_command.dart';
import 'package:koality_tools/src/utilities.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_updater/pub_updater.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

import 'package:koality_tools/src/command_runner.dart';

import '../../../mocks.dart';

void main() {
  group('apple', () {
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

    test('required-apis: can be instantiated without a pub updater', () {
      final command = AppleCommand(logger: logger);
      expect(command, isNotNull);
    });

    test(
      'required-apis: handles searching the Swift file',
      () async {
        final result = await commandRunner.run(['apple', 'required-apis', '--path', './test/files']);
        expect(result, equals(ExitCode.success.code));
        verify(() => logger.info('Searching for creationDate in ./test/files...', style: yellowTextStyle)).called(1);
        verifyNever(() => logger.err('Error running grep'));
      },
    );
  });
}

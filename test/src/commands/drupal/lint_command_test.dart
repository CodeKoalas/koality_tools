import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_updater/pub_updater.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

import 'package:koality_tools/src/command_runner.dart';

import '../../../mocks.dart';

void main() {
  group('lint', () {
    late PubUpdater updater;
    late Logger logger;
    late KoalityToolsCommandRunner commandRunner;
    late ProviderContainer container;

    setUp(() {
      final progress = MockProgress();
      final progressLogs = <String>[];
      container = ProviderContainer();
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

    test(
      'can be called',
      () async {
        final dir = Directory.current.path;
        final result = await commandRunner.run(['drupal', 'lint', '--drupal-root', dir]);
        expect(result, equals(ExitCode.software.code));
        verify(() => logger.err('Unable to locate vendor directory')).called(1);
        verifyNever(
          () => logger.info('Successfully ran lints in [./docroot/modules/custom] + [./docroot/themes/custom].'),
        );
      },
    );
  });
}

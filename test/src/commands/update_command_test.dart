import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_updater/pub_updater.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

import 'package:koality_tools/src/commands/commands.dart';
import 'package:koality_tools/src/command_runner.dart';
import 'package:koality_tools/src/constants.dart';
import 'package:koality_tools/src/version.dart';

import '../../mocks.dart';
import '../constants.dart';

void main() {
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

      when(
        () => updater.getLatestVersion(kPackageName),
      ).thenAnswer((_) async => latestVersion);
      when(() => progress.complete(any())).thenAnswer((_) {
        final message = _.positionalArguments.elementAt(0) as String?;
        if (message != null) progressLogs.add(message);
      });
      when(() => logger.progress(any())).thenReturn(progress);
    });

    test('can be instantiated without a pub updater', () {
      final command = UpdateCommand(logger: logger, updater: updater);
      expect(command, isNotNull);
    });

    test(
      'handles pub latest version query errors',
      () async {
        when(
          () => updater.getLatestVersion(kPackageName),
        ).thenThrow(Exception('oops'));
        final result = await commandRunner.run(['update']);
        expect(result, equals(ExitCode.software.code));
        verify(() => logger.progress('Checking for updates')).called(1);
        verify(() => logger.err('Exception: oops'));
        verifyNever(
          () => updater.update(packageName: kPackageName, versionConstraint: latestVersion),
        );
      },
    );

    test(
      'handles pub update errors',
      () async {
        when(
          () => updater.getLatestVersion(kPackageName),
        ).thenAnswer((_) async => latestVersion);
        when(
          () => updater.update(packageName: kPackageName, versionConstraint: latestVersion),
        ).thenThrow(Exception('oops'));
        final result = await commandRunner.run(['update']);
        expect(result, equals(ExitCode.software.code));
        verify(() => logger.progress('Checking for updates')).called(1);
        verify(() => logger.err('Exception: oops'));
        verify(
          () => updater.update(packageName: kPackageName, versionConstraint: latestVersion),
        ).called(1);
      },
    );

    test(
      'updates when newer version exists',
      () async {
        when(
          () => updater.getLatestVersion(kPackageName),
        ).thenAnswer((_) async => latestVersion);
        when(
          () => updater.update(packageName: kPackageName, versionConstraint: latestVersion),
        ).thenAnswer((_) => Future.value(ProcessResult(0, 0, '', '')));
        when(() => logger.progress(any())).thenReturn(MockProgress());
        final result = await commandRunner.run(['update']);
        expect(result, equals(ExitCode.success.code));
        verify(() => logger.progress('Checking for updates')).called(1);
        verify(() => logger.progress('Updating to $latestVersion')).called(1);
        verify(() => updater.update(packageName: kPackageName, versionConstraint: latestVersion)).called(1);
      },
    );

    test(
      'does not update when already on latest version',
      () async {
        when(
          () => updater.getLatestVersion(kPackageName),
        ).thenAnswer((_) async => packageVersion);
        when(() => logger.progress(any())).thenReturn(MockProgress());
        final result = await commandRunner.run(['update']);
        expect(result, equals(ExitCode.success.code));
        verify(
          () => logger.info('CLI is already at the latest version.'),
        ).called(1);
        verifyNever(() => logger.progress('Updating to $latestVersion'));
        verifyNever(() => updater.update(packageName: kPackageName, versionConstraint: latestVersion));
      },
    );
  });
}

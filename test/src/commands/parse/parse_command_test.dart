import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pub_updater/pub_updater.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

import 'package:koality_tools/src/command_runner.dart';
import 'package:koality_tools/src/commands/parse/parse_command.dart';

import '../../../mocks.dart';

void main() {
  const yamlFile = 'test/files/pubspec.yaml';

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

    test('can be instantiated without a pub updater', () {
      final command = ParseCommand(logger: logger);
      expect(command, isNotNull);
    });

    test(
      'handles parsing YAML file',
      () async {
        final dir = Directory.current.path;
        final result = await commandRunner.run(['parse', 'version', '--path', '$dir/$yamlFile']);
        expect(result, equals(ExitCode.success.code));
        verify(() => logger.write('0.2.0')).called(1);
        verifyNever(() => logger.err('Failed to read pubspec.yaml file.'));
      },
    );
  });
}

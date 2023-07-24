import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// {@template firebase_command}
///
/// `koality firebase emulators`
/// A [Command] to choose a Firebase project and start the emulators for it.
/// {@endtemplate}
class FirebaseEmulatorsCommand extends Command<int> {
  /// {@macro firebase_command}
  FirebaseEmulatorsCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser.addOption(
      'project',
      abbr: 'p',
      help: 'The firebase project ID we want to use the emulators for.',
      mandatory: true,
    );
  }

  @override
  String get description => 'A command to start Firebase emulator suite.';

  @override
  String get name => 'emulators';

  final Logger _logger;
  // ignore: unused_field
  final ProviderContainer _container;

  @override
  Future<int> run() async {
    /// This command is in charge of installing the Firebase CLI tools, then prompting if
    /// we should create the firebase.json file in this directory.
    final firebaseProjectID = argResults?['project'] as String;
    _logger
      ..info('Running firebase emulators command')
      ..info('Setting Firebase project to $firebaseProjectID');
    final result = await Process.run('firebase', ['use', firebaseProjectID]);
    if (result.exitCode != 0) {
      _logger
        ..err('Failed to set Firebase project to $firebaseProjectID')
        ..err(result.stdout.toString());
      return result.exitCode;
    }

    try {
      /// Now let's start the emulators.
      _logger.info('Starting Firebase emulators');
      [
        'firebase',
        'emulators:start',
      ].join(' ').start(terminal: true);
    } catch (e) {
      _logger.err(e.toString());
      return ExitCode.software.code;
    }
    return ExitCode.success.code;
  }
}

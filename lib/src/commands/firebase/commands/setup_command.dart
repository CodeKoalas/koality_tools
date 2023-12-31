import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:koality_tools/src/utilities.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template firebase_setup_command}
///
/// `koality firebase setup`
/// A [Command] to setup Firebase tools locally.
/// {@endtemplate}
class FirebaseSetupCommand extends Command<int> {
  /// {@macro firebase_setup_command}
  FirebaseSetupCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser.addFlag(
      'npm',
      abbr: 'n',
      help: 'Install Firebase tools with NPM instead of Yarn.',
    );
  }

  @override
  String get description => 'A command to setup Firebase tools.';

  @override
  String get name => 'setup';

  final Logger _logger;

  @override
  Future<int> run() async {
    /// This command is in charge of installing the Firebase CLI tools, then prompting if
    /// we should create the firebase.json file in this directory.
    final useNpm = argResults?['npm'] as bool;
    _logger.info('Running firebase setup command');

    /// Now let's make sure the Firebase tools are installed globally with Yarn or NPM depending
    /// on the arg.
    final code = await installFirebaseCLI(useNpm: useNpm);
    if (code == ExitCode.software.code) {
      /// We failed, exit out;
      return code;
    }

    // Now check if we should Firebase init this directory.
    final shouldInit = _logger.prompt('Would you like to initialize Firebase in this directory?', defaultValue: 'yes');
    if (shouldInit.isYes) {
      /// Now we need to call firebase init here.
      _logger.info('Initializing Firebase in this directory');

      /// Now let's create the firebase.json file.
      final firebaseConfigFile = File('firebase.json')
        ..createSync()
        ..writeAsStringSync(firebaseJsonFileContents);
      if (!firebaseConfigFile.existsSync()) {
        _logger.err('Failed to initialize firebase.json in this directory');
        return ExitCode.software.code;
      }

      /// Now let's create the .firebaserc file.
      final firebaseRCFile = File('.firebaserc')
        ..createSync()
        ..writeAsStringSync(firebaseRCFileContents);
      if (!firebaseRCFile.existsSync()) {
        _logger.err('Failed to initialize .firebaserc file in this directory');
        return ExitCode.software.code;
      }
    }

    return ExitCode.success.code;
  }

  /// Install the Firebase CLI tool with NPM/Yarn based on the arg.
  Future<int> installFirebaseCLI({required bool useNpm}) async {
    if (useNpm) {
      /// Now let's make sure the Firebase tools are installed globally with NPM.
      _logger.info('Installing Firebase tools with NPM');
      return installFirebaseCLIWithNpm();
    } else {
      /// Now let's make sure the Firebase tools are installed globally with Yarn.
      _logger.info('Installing Firebase tools with Yarn');
      return installFirebaseCLIWithYarn();
    }
  }

  /// Install the Firebase CLI tool with NPM.
  Future<int> installFirebaseCLIWithNpm() async {
    final result = await Process.run('npm', ['install', '-g', 'firebase-tools']);
    if (result.exitCode != 0) {
      _logger.err('Failed to install Firebase tools with NPM');
    }
    return result.exitCode;
  }

  /// Install the Firebase CLI tool with Yarn.
  Future<int> installFirebaseCLIWithYarn() async {
    final result = await Process.run('yarn', ['global', 'add', 'firebase-tools']);
    if (result.exitCode != 0) {
      _logger
        ..err('Failed to install Firebase tools with Yarn')
        ..err(result.stderr.toString());
    }
    return result.exitCode;
  }
}

String firebaseRCFileContents = '''
{
  "projects": {
    "default": "koality-tools"
  }
}
''';

String firebaseJsonFileContents = '''
{
  "emulators": {
    "singleProjectMode": false,
    "auth": {
      "port": 9099
    },
    "firestore": {
      "port": 8080
    },
    "ui": {
      "enabled": true
    }
  }
}
''';

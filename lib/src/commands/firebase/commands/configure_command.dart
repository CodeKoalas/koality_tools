import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

import 'package:koality_tools/src/providers/config.dart';

/// {@template firebase_command}
///
/// `koality firebase configure`
/// A [Command] to fetch Firebase config files from the CLI.
/// {@endtemplate}
class FirebaseConfigureCommand extends Command<int> {
  /// {@macro poeditor_command}
  FirebaseConfigureCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser
      ..addOption('dev', abbr: 'd', help: 'The dev firebase project name.')
      ..addOption('prod', abbr: 'p', help: 'The prod firebase project name.')
      ..addFlag('skip-dev', abbr: 's', help: 'Skip configuring the dev project.')
      ..addFlag('skip-prod', abbr: 'z', help: 'Skip configuring the prod project.');
  }

  @override
  String get description => 'A command to configure the Firebase dart options file from a Firebase project.';

  @override
  String get name => 'configure';

  final Logger _logger;
  final ProviderContainer _container;

  @override
  Future<int> run() async {
    /// This command is in charge of running the flutterfire configure command.
    /// We take a handful of args for overriding scenarios where we may not want to
    /// configure both dev and prod.
    final devName = argResults?['dev'] as String?;
    final prodName = argResults?['prod'] as String?;
    final skipDevArg = argResults?['skip-dev'] as bool?;
    final skipProdArg = argResults?['skip-prod'] as bool?;
    final config = await _container.read(getKoalityConfigProvider(logger: _logger).future);
    _logger.info('Running firebase configure command');

    // Command line takes precedence over config.
    final skipDev = skipDevArg ?? config.firebaseConfig.skipDev;
    final skipProd = skipProdArg ?? config.firebaseConfig.skipProd;

    // If anything fails we want to report back there was a failure.
    var success = true;
    if (!skipDev) {
      success = await flutterfireConfigureProject(logger: _logger, env: 'dev', name: devName);
    }

    if (!skipProd) {
      success = await flutterfireConfigureProject(logger: _logger, env: 'prod', name: prodName);
    }

    return success ? ExitCode.success.code : ExitCode.software.code;
  }
}

// Let's create a function that will gather info from the user and then run flutterfire config
Future<bool> flutterfireConfigureProject({required Logger logger, required String env, String? name}) async {
  final project = name ?? logger.prompt('Name of the Firebase $env project?');
  final iosBundle = logger.prompt('iOS Bundle ID for $env');
  final androidBundle = logger.prompt('Android Bundle ID for $env');
  final firebaseOptionsOutputFile = logger.prompt(
    'Path to outfile for flutterfire dart files',
    defaultValue: 'lib/features/firebase/domain/value_objects/firebase_options_$env.dart',
  );

  if (iosBundle.isEmpty || androidBundle.isEmpty || firebaseOptionsOutputFile.isEmpty) {
    logger.err('You must provide all the required values.');
    return false;
  }

  // Now call the FlutteFire command.
  await Process.run(
    'flutterfire',
    ['configure', '-p', project, '-i', iosBundle, '-a', androidBundle, '-o', firebaseOptionsOutputFile],
  );
  // Now let's move the ios/Runner/GoogleService-Info.plist file into the ios/config/dev directory.
  await Process.run('mv', ['ios/Runner/GoogleService-Info.plist', 'ios/config/$env/GoogleService-Info.plist']);
  // Now let's move the ios/firebase_app_id_file.json file into the ios/config/dev directory.
  await Process.run('mv', ['ios/firebase_app_id_file.json', 'ios/config/$env/firebase_app_id_file.json']);
  // Now let's move the android/app/google-services.json file into the android/app/src/dev directory.
  await Process.run('mv', ['android/app/google-services.json', 'android/app/src/$env/google-services.json']);

  return true;
}

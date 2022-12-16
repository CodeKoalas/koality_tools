import 'dart:io';

import 'package:mason_logger/mason_logger.dart';

/// A basic function that will check for the existence of Gum.
/// Will ensure it's installed before trying to use it with other scripts.
Future<bool> gumInstalled() async {
  final process = await Process.run('command', ['-v', 'gum']);
  return process.stdout.toString().isNotEmpty;
}

Future<ProcessResult> installGum(Logger logger) async {
  final installGumProcess = await Process.run('brew', ['install', 'gum']);
  if (installGumProcess.exitCode > 0) {
    logger.info('Failed to install Gum.');
  }
  logger.info('Installed Gum successfully!');
  return installGumProcess;
}

Future<ProcessResult> installJq(Logger logger, {bool useGum = true}) async {
  late final ProcessResult installJqProcess;
  if (useGum) {
    // gum confirm --default "Do you want to install 'jq'?" && brew install jq
    installJqProcess = await Process.run('gum', ['confirm', '--default', 'Do you want to install jq?', '&&', 'brew', 'install', 'jq']);
  } else {
    installJqProcess = await Process.run('brew', ['install', 'jq']);
  }

  if (installJqProcess.exitCode > 0) {
    logger.info('Failed to install jq.');
  }
  logger.info('Installed jq successfully!');

  return installJqProcess;
}

Future<ProcessResult> installCurl(Logger logger, {bool useGum = true}) async {
  late final ProcessResult installCurlProcess;
  if (useGum) {
    // gum confirm --default "Do you want to install 'curl'?" && brew install curl
    installCurlProcess = await Process.run('gum', ['confirm', '--default', 'Do you want to install curl?', '&&', 'brew', 'install', 'curl']);
  } else {
    installCurlProcess = await Process.run('brew', ['install', 'curl']);
  }

  if (installCurlProcess.exitCode > 0) {
    logger.info('Failed to install curl.');
  }
  logger.info('Installed curl successfully!');

  return installCurlProcess;
}

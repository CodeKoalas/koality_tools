import 'dart:io';

import 'package:mason_logger/mason_logger.dart';

/// A basic function that will check for the existence of Gum.
/// Will ensure it's installed before trying to use it with other scripts.
Future<bool> gumInstalled() async {
  final process = await Process.run('command', ['-v', 'gum']);
  return process.stdout.toString().isNotEmpty;
}

Future<bool> jqInstalled() async {
  final process = await Process.run('command', ['-v', 'jq']);
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

Future<ProcessResult> installJq(Logger logger) async {
  final installJqProcess = await Process.run('brew', ['install', 'jq']);

  if (installJqProcess.exitCode > 0) {
    logger.info('Failed to install jq.');
  }
  logger.info('Installed jq successfully!');

  return installJqProcess;
}

Future<ProcessResult> installCurl(Logger logger) async {
  final installCurlProcess = await Process.run('brew', ['install', 'curl']);

  if (installCurlProcess.exitCode > 0) {
    logger.info('Failed to install curl.');
  }
  logger.info('Installed curl successfully!');

  return installCurlProcess;
}

Future<ProcessResult> installVeryGoodCli(Logger logger) async {
  final installVeryGoodCliProcess = await Process.run('dart', ['pub', 'global', 'activate', 'very_good_cli']);

  if (installVeryGoodCliProcess.exitCode > 0) {
    logger.info('Failed to install very_good_cli.');
  }
  logger.info('Installed very_good_cli successfully!');

  return installVeryGoodCliProcess;
}

Future<ProcessResult> installRps(Logger logger) async {
  final installVeryGoodCliProcess = await Process.run('dart', ['pub', 'global', 'activate', 'rps']);

  if (installVeryGoodCliProcess.exitCode > 0) {
    logger.info('Failed to install rps.');
  }
  logger.info('Installed rps successfully!');

  return installVeryGoodCliProcess;
}

bool confirmUserChoice({required String confirmMessage, required Logger logger}) {
  final choice = logger.prompt(confirmMessage);
  if (choice == 'y' || choice == 'yes') {
    return true;
  } else {
    return false;
  }
}

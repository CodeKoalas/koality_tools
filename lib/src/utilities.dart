import 'dart:io';

import 'package:mason_logger/mason_logger.dart';

enum PackageTool {
  brew('brew', []),
  dart('dart', ['pub', 'global', 'activate']),
  npm('npm', ['install', '-g']);

  const PackageTool(this.commandName, this.commandArgs);

  final String commandName;
  final List<String> commandArgs;
}

/// A basic function that will check for the existence of Gum.
/// Will ensure it's installed before trying to use it with other scripts.
Future<bool> isExecutableInstalled(String executableName) async {
  final process = await Process.run('command', ['-v', executableName]);
  return process.stdout.toString().isNotEmpty;
}

Future<void> handleInstallPackage({
  required Logger logger,
  required String packageName,
  required PackageTool tool,
  bool skipAsking = false,
}) async {
  if (await isExecutableInstalled(packageName)) {
    logger.info('$packageName is already installed.');
  } else {
    logger.info('$packageName is not installed.');
    if (!skipAsking) {
      final confirmChoice = confirmUserChoice(confirmMessage: 'Install $packageName?', logger: logger);
      if (confirmChoice) {
        await installPackage(logger: logger, packageName: packageName, tool: tool);
      } else {
        logger.info('Skipping $packageName installation.');
      }
    } else {
      await installPackage(logger: logger, packageName: packageName, tool: tool);
    }

    /// If we failed installing then we move onto the next.
    logger.info('Finished installing $packageName.');
  }
}

Future<ProcessResult> installPackage({
  required Logger logger,
  required String packageName,
  required PackageTool tool,
}) async {
  final installProcess = await Process.run(tool.commandName, [...tool.commandArgs, packageName]);

  if (installProcess.exitCode > 0) {
    logger.info('Failed to install $packageName with ${tool.commandName}.');
  }
  logger.info('Installed $packageName with ${tool.commandName} successfully!');

  return installProcess;
}

bool confirmUserChoice({required String confirmMessage, required Logger logger}) {
  final choice = logger.prompt(confirmMessage);
  if (choice == 'y' || choice == 'yes') {
    return true;
  } else {
    return false;
  }
}

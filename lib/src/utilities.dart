import 'dart:io';

import 'package:koality_tools/src/models/package_install.dart';
import 'package:mason_logger/mason_logger.dart';

enum PackageTool {
  brew('brew', []),
  dart('dart', ['pub', 'global', 'activate']),
  npm('npm', ['install', '-g']);

  const PackageTool(this.commandName, this.commandArgs);

  final String commandName;
  final List<String> commandArgs;
}

extension StringifyYesNo on String {
  bool get isYes => this == 'y' || this == 'yes';
}

/// A basic function that will check for the existence of Gum.
/// Will ensure it's installed before trying to use it with other scripts.
Future<bool> isExecutableInstalled(String executableName) async {
  final process = await Process.run('command', ['-v', executableName]);
  return process.stdout.toString().isNotEmpty;
}

/// Handles installing a single executable package. Will first check to see if the executable
/// is already installed before asking.
Future<void> handleInstallPackage({
  required Logger logger,
  required PackageInstallStruct struct,
  bool skipAsking = false,
}) async {
  if (await isExecutableInstalled(struct.commandName)) {
    logger.info('${struct.packageName} is already installed.');
  } else {
    logger.info('${struct.packageName} is not installed.');
    if (!skipAsking) {
      final confirmChoice = confirmUserChoice(confirmMessage: 'Install ${struct.packageName}?', logger: logger);
      if (confirmChoice) {
        await installPackage(logger: logger, packageName: struct.packageName, tool: struct.tool);
      } else {
        logger.info('Skipping ${struct.packageName} installation.');
      }
    } else {
      await installPackage(logger: logger, packageName: struct.packageName, tool: struct.tool);
    }

    /// If we failed installing then we move onto the next.
    logger.info('Finished installing ${struct.packageName}.');
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
  if (choice.isYes) {
    return true;
  } else {
    return false;
  }
}

import 'dart:io';

import 'package:mason_logger/mason_logger.dart';

const riverpodGithubUrl = 'https://github.com/rrousselGit/riverpod.git';

/// This function will make sure that when running dart pub global riverpod_graph will be available.
bool ensureRiverpodGraphInstalled(Logger logger) {
  final results = Process.runSync('dart', ['pub', 'global', 'list']);
  if (results.stdout.toString().contains('riverpod_graph')) {
    logger.info('Riverpod Graph is installed');
    return true;
  } else {
    // Let's try configuring it.
    final shouldSetUp = logger.prompt(
      'Riverpod graph not installed, do you want to install it into "~/Development/flutter-plugins"? (y/n)',
      defaultValue: 'y',
    );

    if (shouldSetUp == 'y') {
      // Let's make sure ~/Development exists and then also that flutter-plugins exists.
      final homeDir = Directory('~/Development/flutter-plugins');
      try {
        if (!homeDir.existsSync()) {
          homeDir.createSync(recursive: true);
        }

        // Now let's git clone riverpod from Github into this directory.
        Process.runSync(
          'git',
          [
            'clone',
            riverpodGithubUrl,
            homeDir.path,
          ],
        );

        // Great, now we can activate riverpod graph.
        Process.runSync(
          'dart',
          [
            'pub',
            'global',
            'activate',
            '--source',
            'path',
            '${homeDir.path}/riverpod/packages/riverpod_graph',
          ],
        );

        return true;
      } catch (e) {
        throw Exception('Could not create ~/Development/flutter-plugins');
      }
    } else {
      return false;
    }
  }
}

bool ensureMermaidCliInstalled(Logger logger) {
  final results = Process.runSync('which', ['mmdc']);

  if (results.stdout.toString().contains('mmdc')) {
    stdout.writeln('Mermaid CLI is installed');
    return true;
  } else {
    // Let's try installing through brew.
    final shouldSetUp = logger.prompt(
      'Mermaid CLI not installed, do you want to install it through brew? (y/n)',
      defaultValue: 'y',
    );

    if (shouldSetUp == 'y') {
      try {
        Process.runSync('brew', ['install', 'mmdc',],);
        return true;
      } catch (e) {
        throw Exception('Could not install Mermaid CLI');
      }
    } else {
      return false;
    }
  }
}

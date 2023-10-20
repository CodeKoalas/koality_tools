import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

/// {@template drupal_lint_command}
///
/// `koality drupal lint`
/// A [Command] to run Drupal PHPCS lint.
/// {@endtemplate}
class DrupalLintCommand extends Command<int> {
  /// {@macro kubectl_clean_pods_command}
  DrupalLintCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser
      ..addOption(
        'drupal-root',
        abbr: 'r',
        help: 'The root directory of the Drupal site.',
        defaultsTo: './',
      )
      ..addOption(
        'modules-root',
        abbr: 'm',
        help: 'The root directory of custom modules.',
        defaultsTo: './docroot/modules/custom',
      )
      ..addOption(
        'themes-root',
        abbr: 't',
        help: 'The root directory of custom themes.',
        defaultsTo: './docroot/themes/custom',
      )
      ..addOption(
        'ignored-directories',
        abbr: 'd',
        help: 'A comma separated list of directories we ignore checking.',
        defaultsTo: _ignoredDirectories.join(','),
      )
      ..addOption(
        'checked-extensions',
        abbr: 'c',
        help: 'A comma separated list of extensions we run lints on.',
        defaultsTo: _checkedExtensions.join(','),
      )
      ..addFlag(
        'fix-errors',
        abbr: 'e',
        help: 'Attempt to fix errors.',
      );
  }

  @override
  String get description => 'A command to run PHP linting against certain directories.';

  @override
  String get name => 'lint';

  final Logger _logger;
  // ignore: unused_field
  final ProviderContainer _container;

  final List<String> _ignoredDirectories = [
    'vendor',
    'node_modules',
    'bower_components',
  ];

  final List<String> _checkedExtensions = [
    'php',
    'module',
    'inc',
    'install',
    'test',
    'profile',
    'theme',
    'css',
    'info',
    'txt',
    'md',
    'yml',
  ];

  @override
  Future<int> run() async {
    final drupalRoot = argResults?['drupal-root'] as String;
    final modulesRoot = argResults?['modules-root'] as String;
    final themesRoot = argResults?['themes-root'] as String;
    final usePhpcbf = argResults?['fix-errors'] as bool;
    final ignoredDirectories = argResults?['ignored-directories'] as String? ?? _ignoredDirectories.join(',');
    final checkedExtensions = argResults?['checked-extensions'] as String? ?? _checkedExtensions.join(',');
    _logger.info('Running drupal lint command');

    /// Now let's run some default PHPCS linting command, ignoring vendor and some other directories.
    try {
      final vendorDir = Directory('${drupalRoot}vendor');
      _logger.info('Checking for vendor directory at ${vendorDir.path}');
      if (vendorDir.existsSync()) {
        final command = usePhpcbf ? 'phpcbf' : 'phpcs';
        final phpcs = File('${vendorDir.path}/bin/$command');
        _logger.info('Checking for PHPCS at ${phpcs.path}');
        if (phpcs.existsSync()) {
          // Now let's run PHPCS from the vendor directory and only check certain places.
          final progress = _logger.progress('Running lint in modules.');
          final lintProcessModules = await Process.run(
            phpcs.absolute.path,
            [
              '--standard=Drupal',
              '--extensions=$checkedExtensions',
              '--ignore=$ignoredDirectories',
              modulesRoot,
            ],
          );

          if (lintProcessModules.exitCode != 0) {
            progress.complete(red.wrap('Failed to run lint in $modulesRoot'));
            _logger.err(lintProcessModules.stdout.toString());
            return ExitCode.software.code;
          } else {
            progress.update(green.wrap('Successfully ran lint in $modulesRoot.')!);
          }

          final lintProcessThemes = await Process.run(
            phpcs.absolute.path,
            [
              '--standard=Drupal',
              '--extensions=$checkedExtensions',
              '--ignore=$ignoredDirectories',
              themesRoot,
            ],
          );

          if (lintProcessThemes.exitCode != 0) {
            progress.complete(red.wrap('Failed to run lint in $themesRoot'));
            _logger.err(lintProcessThemes.stdout.toString());
            return ExitCode.software.code;
          } else {
            progress.complete(green.wrap('Successfully ran lints in [$modulesRoot] + [$themesRoot].'));
          }
        } else {
          _logger.warn('PHPCS not found in vendor directory. Skipping PHPCS linting.');
          return ExitCode.config.code;
        }
      } else {
        _logger.err('Unable to locate vendor directory');
        return ExitCode.software.code;
      }
    } catch (e) {
      _logger.err(e.toString());
      return ExitCode.software.code;
    }

    return ExitCode.success.code;
  }
}

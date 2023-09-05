// ignore_for_file: dead_code

import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod/riverpod.dart';

// Global providers.
import 'package:koality_tools/src/providers/package_pubpsec.dart';

/// @TODO: Fixup the code to correctly rename files and write test.
/// {@template scaffold_command}
///
/// `koality scaffold`
/// A [Command] to try and update some native files to match values in the pubspec file.
/// {@endtemplate}
class ScaffoldCommand extends Command<int> {
  /// {@macro scaffold_command}
  ScaffoldCommand({
    required Logger logger,
    required ProviderContainer container,
  })  : _logger = logger,
        _container = container {
    argParser
      ..addOption('bundle', abbr: 'b', mandatory: true, help: 'The old package bundle name.')
      ..addOption('app-name', abbr: 'o', mandatory: true, help: 'The old app name.')
      ..addOption('path', abbr: 'p', help: 'The path we want to start at.')
      ..addOption('ios', abbr: 'i', help: 'The path to the ios folder.')
      ..addOption('android', abbr: 'a', help: 'The path to the android folder.')
      ..addOption(
        'android-lang',
        abbr: 'l',
        help: 'The language used for Android (kotlin or java).',
        allowed: ['kotlin', 'java'],
        defaultsTo: 'kotlin',
      )
      ..addOption(
        'android-test-lang',
        abbr: 't',
        help: 'The language used for Android tests (kotlin or java).',
        allowed: ['kotlin', 'java'],
        defaultsTo: 'kotlin',
      );
  }

  @override
  String get description => 'A command to scaffold the project with data in the pubspec.yaml.';

  @override
  String get name => 'scaffold';

  final Logger _logger;
  final ProviderContainer _container;

  @override
  Future<int> run() async {
    // @TODO: Sort this command out.
    _logger.warn('Not fully implemented yet.');
    return ExitCode.success.code;

    final androidLanguage = argResults?['android-lang'] as String;
    final androidTestLanguage = argResults?['android-test-lang'] as String;
    final oldAppName = argResults?['app-name'] as String;
    final bundleName = argResults?['bundle'] as String;
    final pathArg = argResults?['path'] as String?;
    final iosArg = argResults?['ios'] as String?;

    // Get the path from the input arg or just grab
    // the current working directory.
    late final String path;
    if (pathArg == null) {
      path = Directory.current.path;
    } else {
      path = pathArg;
    }

    // Get the path to the iOS directory.
    late final String iosPath;
    if (iosArg == null) {
      iosPath = '${Directory.current.path}/ios';
    } else {
      iosPath = iosArg;
    }

    final loadedPubspec = await _container.read(getPackagePubspecProvider(path: path).future);
    _logger.info('Loaded pubspec.yaml: $path');

    // Need to make sure the getPubpsecOptions is not null otherwise we need to throw an error
    // and exit.
    if (loadedPubspec['koality_scaffold'] == null) {
      throw Exception('Options must be in the "koality_scaffold" key in your pubspec.yaml file.');
    }

    final data = loadedPubspec['koality_scaffold'] as Map<String, dynamic>;

    final packageName = data['package_name'] as String;
    final appName = data['app_name'] as String;
    final oldPackagePath = bundleName.replaceAll('.', '/');

    // @TODO: Fix these up to better handle updating files.
    // Now try renaming the android files.
    await fixAndroidAppDirectoryNames(_logger, path, packageName, oldPackagePath, androidLanguage);

    // Now try renaming the android test files.
    await fixAndroidAppTestDirectoryNames(_logger, path, packageName, oldPackagePath, androidTestLanguage);

    // Fix the android manifest file.
    await fixAndroidManifestPackage(path, packageName, appName);

    // Fixing the package for the activities.
    await fixAndroidActivitiesFiles(path, packageName, androidLanguage);

    // Fixing app build.gradle file
    await fixAndroidGradleBuildFileBundleNames(_logger, path, packageName);

    // Fixing app build.gradle files flavors.
    await fixAndroidGradleBuildFileFlavorNames(_logger, path, oldAppName, appName);

    // Fixing the package name for pbxproj files.
    await fixIosPbxprojFile(path, packageName, iosPath);

    return ExitCode.success.code;
  }
}

// Easy to reference Android paths.
const androidAppGradleBuildPath = '/android/app/build.gradle';
const androidBasePath = '/android/app/src';

const androidMainPath = '/main';
const androidDebugPath = '/debug';
const androidProfilePath = '/profile';
const androidTestPath = '/androidTest';

// Easy to reference full paths.
const androidFullProfilePath = androidBasePath + androidProfilePath;
const androidFullDebugPath = androidBasePath + androidDebugPath;
const androidFullMainPath = androidBasePath + androidMainPath;

// Kotlin path and test paths.
String getAndroidFullPath(String lang) => '$androidBasePath$androidMainPath/$lang';
String getAndroidFullTestPath(String lang) => '$androidBasePath$androidTestPath/$lang';

const iosBasePath = '/ios';
const iosBasePathPbxproj = '/Runner.xcodeproj/project.pbxproj';

/// Allows overriding the default path for use with custom configured projects.
Future<void> fixIosPbxprojFile(String path, String packageName, [String? customPath]) async {
  final basePath = customPath ?? path;
  final pbxprojPath = basePath + iosBasePath + iosBasePathPbxproj;
  if (FileSystemEntity.isFileSync(pbxprojPath)) {
    // Adding the empty string for Mac OSX since it requires a file name for the replacement file
    // and if we leave it blank then it prevents Mac from creating a "backup" file.
    await Process.run(
      'sed',
      [
        '-i',
        '',
        '-e',
        's/PRODUCT_BUNDLE_IDENTIFIER = [^;]*;/PRODUCT_BUNDLE_IDENTIFIER = $packageName;/g',
        pbxprojPath,
      ],
    );
  }
}

Future<void> _fixAndroidDirectoryNames(
  Logger logger,
  String currentPath,
  String packageName,
  String bundlePath,
) async {
  // Make sure the current path exists.
  final fullPath = '$currentPath/$bundlePath';
  if (FileSystemEntity.isDirectorySync(fullPath)) {
    /// Now we need to split apart the package name. Then use those parts to rename each directory underneath
    /// the full path.
    final packageParts = packageName.split('.');
    final newPath = packageParts.join('/');
    final newFullPath = '$currentPath/$newPath';
    try {
      // Create the new directories. And now we move all the files to the new directory.
      logger.info('Creating directory: $newFullPath');
      final dir = Directory(newFullPath)..createSync(recursive: true);
      final currentDirectory = Directory(fullPath);
      final files = currentDirectory.listSync();
      for (final file in files) {
        if (file is File) {
          final fileName = file.path.split('/').last;
          final newFile = File('${dir.path}/$fileName');
          final newlyCreated = await file.copy(newFile.path);
          if (newlyCreated.existsSync()) {
            file.deleteSync();
          }
        }
      }

      // Now delete the old directory.
      await currentDirectory.delete(recursive: true);
    } catch (e) {
      logger.err(e.toString());
    }
  }
}

Future<void> fixAndroidAppDirectoryNames(
  Logger logger,
  String path,
  String packageName,
  String bundlePath,
  String androidLanguage,
) async {
  // make sure we find the directory.
  final fullPath = path + getAndroidFullPath(androidLanguage);
  unawaited(_fixAndroidDirectoryNames(logger, fullPath, packageName, bundlePath));
}

Future<void> fixAndroidAppTestDirectoryNames(
  Logger logger,
  String path,
  String packageName,
  String bundlePath,
  String androidLanguage,
) async {
  // fix directory names for tests if it exists.
  final fullPath = path + getAndroidFullTestPath(androidLanguage);
  unawaited(_fixAndroidDirectoryNames(logger, fullPath, packageName, bundlePath));
}

Future<void> fixAndroidGradleBuildFileFlavorNames(Logger logger, String path, String oldName, String newName) async {
  final fullPath = '$path$androidAppGradleBuildPath';
  final isFile = FileSystemEntity.isFileSync(fullPath);
  if (isFile) {
    logger.info('Fixing gradle build file flavor names.');
    await Process.run(
      'sed',
      [
        '-i',
        '',
        '-e',
        's/$oldName/$newName/g',
        fullPath,
      ],
    );
  }
}

Future<void> fixAndroidGradleBuildFileBundleNames(Logger logger, String path, String packageName) async {
  logger.info('Android build full file path: $path$androidAppGradleBuildPath');
  final fullPath = '$path$androidAppGradleBuildPath';
  final isFile = FileSystemEntity.isFileSync(fullPath);
  logger.info('Android gradle build file exists: $isFile');
  if (isFile) {
    logger.info('Fixing gradle build file.');
    await Process.run(
      'sed',
      [
        '-i',
        '',
        '-e',
        's/applicationId "[^"]*"/applicationId "$packageName"/g',
        fullPath,
      ],
    );

    await Process.run(
      'sed',
      [
        '-i',
        '',
        '-e',
        's/namespace "[^"]*"/namespace "$packageName"/g',
        fullPath,
      ],
    );
  }
}

Future<void> fixAndroidManifestPackage(String path, String packageName, String pubspecName) async {
  /// Find the AndroidManifest.xml file inside the android/app/src/main directory.
  /// Then we need to rewrite any of the <manifest> elements "package" properties.
  ///
  /// And then also rewrite any of the <application> elements "android:label" properties with the pubspec name.
  final manifestPath = '$path$androidFullMainPath/AndroidManifest.xml';
  if (FileSystemEntity.isFileSync(manifestPath)) {
    await Process.run('sed', ['-i', '', '-e', 's/package="[^"]*"/package="$packageName"/g', manifestPath]);
    await Process.run('sed', ['-i', '', '-e', 's/android:label="[^"]*"/android:label="$pubspecName"/g', manifestPath]);
  }

  final debugManifestPath = '$path$androidFullDebugPath/AndroidManifest.xml';
  if (FileSystemEntity.isFileSync(debugManifestPath)) {
    await Process.run(
      'sed',
      ['-i', '', '-e', 's/package="[^"]*"/package="$packageName"/g', debugManifestPath],
    );
    await Process.run(
      'sed',
      ['-i', '', '-e', 's/android:label="[^"]*"/android:label="$pubspecName"/g', debugManifestPath],
    );
  }

  final profileManifestPath = '$path$androidFullProfilePath/AndroidManifest.xml';
  if (FileSystemEntity.isFileSync(profileManifestPath)) {
    await Process.run(
      'sed',
      ['-i', '', '-e', 's/package="[^"]*"/package="$packageName"/g', profileManifestPath],
    );
    await Process.run(
      'sed',
      ['-i', '', '-e', 's/android:label="[^"]*"/android:label="$pubspecName"/g', profileManifestPath],
    );
  }
}

Future<void> fixAndroidActivitiesFiles(String path, String packageName, String androidLanguage) async {
  final files = Directory('$path${getAndroidFullPath(androidLanguage)}/${packageName.split('.').join('/')}').listSync();
  for (final file in files) {
    if (file is File) {
      await Process.run('sed', ['-i', '', '-e', 's/package [^"]*/package $packageName/g', file.path]);
    }
  }
}

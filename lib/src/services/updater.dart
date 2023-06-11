import 'dart:io';

import 'package:dio/dio.dart';

class PackageUpdater {
  const PackageUpdater({required this.client});

  final Dio client;

  String get projectUrl => '/api/v4/projects/640/repository/files/lib%2Fsrc%2Fversion%2Edart/raw?ref=master';
  String get versionTextCheck => 'const packageVersion = ';

  /// Get the latest version from Gitlab.
  Future<String> getLatestVersion() async {
    final response = await client.get<String>(projectUrl);
    if (response.statusCode == 200) {
      /// Now let's parse the string from the dart file and find the version number and compare it to the passed
      /// version number.
      final fileContents = response.data ?? '';
      final versionIndex = fileContents.indexOf(versionTextCheck);
      if (versionIndex >= 0) {
        final versionString = fileContents.substring(versionIndex + 24, versionIndex + 29);
        return versionString;
      }
    }
    return '0.0.0';
  }

  Future<ProcessResult> updatePackage() {
    return Process.run(
      'dart',
      [
        'pub',
        'global',
        'activate',
        '--sgit=git@gitlab.codekoalas.com:internal/koality-tools.git',
      ],
    );
  }
}

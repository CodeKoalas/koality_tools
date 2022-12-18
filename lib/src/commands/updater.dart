import 'dart:io';

import 'package:dio/dio.dart';
import 'package:koality_tools/src/constants.dart';

class PackageUpdater {
  PackageUpdater();

  final Dio client = Dio(
    BaseOptions(
      baseUrl: 'https://gitlab.codekoalas.com',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'PRIVATE-TOKEN': kGitlabAccessToken,
      },
    ),
  );

  final projectUrl = '/api/v4/projects/640/repository/files/lib%2Fsrc%2Fversion%2Edart?ref=master';

  /// Get the latest version from Gitlab.
  Future<String> getLatestVersion() async {
    final response = await client.get<String>(projectUrl);
    if (response.statusCode == 200) {
      /// Now let's parse the string from the dart file and find the version number and compare it to the passed
      /// version number.
      final fileContents = response.data ?? '';
      final versionIndex = fileContents.indexOf('packageVersion = ');
      final versionString = fileContents.substring(versionIndex + 18, versionIndex + 23);
      return versionString;
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

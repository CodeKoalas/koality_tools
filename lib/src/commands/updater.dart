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

  /// Now we need to check and see if the packageVersion value is different than the passed
  /// version to this function.
  Future<bool> updateAvailable() async {
    final response = await client.get<Map<String, dynamic>>(projectUrl);
    print(response.data);
    return true;
  }
}

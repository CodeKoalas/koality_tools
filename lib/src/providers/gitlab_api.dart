import 'package:dio/dio.dart';
import 'package:koality_tools/src/providers/config.dart';
import 'package:koality_tools/src/services/gitlab_api.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gitlab_api.g.dart';

@riverpod
Future<GitlabApi> getGitlabApi(
  GetGitlabApiRef ref, {
  required Logger logger,
}) async {
  final config = await ref.watch(getKoalityConfigProvider(logger: logger).future);
  final headers = <String, dynamic>{
    if (config.gitlabConfig.gitlabAccessToken.isNotEmpty) 'PRIVATE_TOKEN': config.gitlabConfig.gitlabAccessToken,
  };
  return GitlabApi(
    client: Dio(
      BaseOptions(
        baseUrl: config.gitlabConfig.gitlabApiUrl,
        headers: headers,
      ),
    ),
  );
}

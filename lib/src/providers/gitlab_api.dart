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
  String? accessToken,
}) async {
  final config = await ref.watch(getKoalityConfigProvider(logger: logger).future);
  final token = accessToken ?? config.gitlabConfig.gitlabAccessToken;
  final headers = <String, dynamic>{
    if (token.isNotEmpty) 'PRIVATE-TOKEN': token,
  };
  return GitlabApi(
    logger: logger,
    client: Dio(
      BaseOptions(
        baseUrl: config.gitlabConfig.gitlabApiUrl,
        headers: headers,
      ),
    ),
  );
}

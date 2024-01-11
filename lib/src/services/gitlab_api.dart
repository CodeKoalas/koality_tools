import 'package:dio/dio.dart';

/// A service class representing the Gitlab API.
class GitlabApi {
  /// Builds a [GitlabApi] instance.
  const GitlabApi({
    required this.client,
  });

  /// The client used to make requests.
  final Dio client;

  String getAllProjectsUrl() => '/projects';
  String getProjectUrl(int projectId) => '${getAllProjectsUrl()}/$projectId';
  String getProjectVariablesUrl(int projectId) => '${getProjectUrl(projectId)}/variables';
  String getProjectEnvironmentsUrl(int projectId) => '${getProjectUrl(projectId)}/environments';
}

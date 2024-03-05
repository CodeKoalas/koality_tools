import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mason_logger/mason_logger.dart';

import 'package:koality_tools/src/models/gitlab_api/project_environment.dart';
import 'package:koality_tools/src/models/gitlab_api/project_variable.dart';
import 'package:koality_tools/src/models/result.dart';

/// A service class representing the Gitlab API.
class GitlabApi {
  /// Builds a [GitlabApi] instance.
  const GitlabApi({
    required this.client,
    required this.logger,
  });

  /// The client used to make requests.
  final Dio client;

  /// The logger used to log messages.
  final Logger logger;

  String getAllProjectsUrl() => '/projects';
  String getProjectUrl(int projectId) => '${getAllProjectsUrl()}/$projectId';
  String getProjectVariablesUrl(int projectId) => '${getProjectUrl(projectId)}/variables';
  String getProjectEnvironmentsUrl(int projectId) => '${getProjectUrl(projectId)}/environments';

  Future<Result<List<GitlabProjectEnvironment>>> getProjectEnvironments({
    required int projectId,
    String? name,
    String? searchTerm,
  }) async {
    assert(name == null || searchTerm == null, 'You can only search by name or search term, not both.');
    try {
      if (name != null) {
        final response = await client.get<List<dynamic>>(
          getProjectEnvironmentsUrl(projectId),
          queryParameters: {
            'name': name,
          },
        );
        return Result.success(
          [...response.data?.map((json) => GitlabProjectEnvironment.fromJson(json as Map<String, dynamic>)) ?? []],
        );
      } else if (searchTerm != null) {
        final response = await client.get<List<dynamic>>(
          getProjectEnvironmentsUrl(projectId),
          queryParameters: {
            'search': searchTerm,
          },
        );
        return Result.success(
          [...response.data?.map((json) => GitlabProjectEnvironment.fromJson(json as Map<String, dynamic>)) ?? []],
        );
      } else {
        final response = await client.get<List<dynamic>>(getProjectEnvironmentsUrl(projectId));
        return Result.success(
          [...response.data?.map((json) => GitlabProjectEnvironment.fromJson(json as Map<String, dynamic>)) ?? []],
        );
      }
    } on DioException catch (e, trace) {
      logger
        ..err(e.toString())
        ..err(e.response?.data.toString());
      return Result.failure(e, trace);
    } catch (e, trace) {
      return Result.failure(e, trace);
    }
  }

  Future<Result<GitlabProjectEnvironment?>> createProjectEnvironment({
    required int projectId,
    required String name,
    required String url,
  }) async {
    logger.info('Using URL: ${client.options.baseUrl}${getProjectEnvironmentsUrl(projectId)}');
    try {
      final response = await client.post<Map<String, dynamic>>(
        getProjectEnvironmentsUrl(projectId),
        data: {
          'name': name,
          'external_url': url,
        },
      );
      return Result.success(GitlabProjectEnvironment.fromJson(response.data!));
    } on DioException catch (e, trace) {
      logger
        ..err(e.toString())
        ..err(e.response?.data.toString());
      return Result.failure(e, trace);
    } catch (e, trace) {
      return Result.failure(e, trace);
    }
  }

  Future<Result<GitlabProjectVariable>> createProjectVariable({
    required int projectId,
    required String key,
    required String value,
    String? description,
    String? environmentScope,
    bool masked = false,
    bool protected = false,
    bool raw = false,
    GitlabProjectVariableType variableType = GitlabProjectVariableType.env_var,
  }) async {
    try {
      final response = await client.post<Map<String, dynamic>>(
        getProjectVariablesUrl(projectId),
        data: {
          'key': key,
          'value': value,
          if (description != null) 'description': description,
          if (environmentScope != null) 'environment_scope': environmentScope,
          'masked': masked,
          'protected': protected,
          'variable_type': variableType.name,
        },
      );
      return Result.success(GitlabProjectVariable.fromJson(response.data!));
    } on DioException catch (e, trace) {
      final requestOptions = {
        'baseUrl': e.requestOptions.baseUrl,
        'path': e.requestOptions.path,
        'queryParameters': e.requestOptions.queryParameters,
        'data': e.requestOptions.data,
        'headers': e.requestOptions.headers,
      };
      logger
        ..err(e.toString())
        ..err(jsonEncode(requestOptions))
        ..err(e.response?.data.toString());
      final data = e.response?.data;
      if (data is Map) {
        final message = data['message'] as Map<String, dynamic>;
        final messageKey = (message['key'] as List<String>).join(' ');
        if (messageKey.contains(key)) {
          return Result.failure(
            'A variable with the key "$key" already exists in the scope "$environmentScope".',
            StackTrace.empty,
          );
        }
      }
      return Result.failure(e, trace);
    } catch (e, trace) {
      return Result.failure(e, trace);
    }
  }
}

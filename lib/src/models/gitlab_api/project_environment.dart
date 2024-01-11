import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_environment.freezed.dart';
part 'project_environment.g.dart';

enum GitlabProjectEnvironmentTier { production, staging, testing, development, other }

@freezed
class GitlabProjectEnvironment with _$GitlabProjectEnvironment {
  const GitlabProjectEnvironment._();
  const factory GitlabProjectEnvironment({
    required String id,
    required String name,
    String? state,
    String? slug,
    String? externalUrl,
    String? tier,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? enableAdvancedLogsQuerying,
    String? logsApiPath,
  }) = _GitlabProjectEnvironment;

  factory GitlabProjectEnvironment.fromJson(Map<String, dynamic> json) => _$GitlabProjectEnvironmentFromJson(json);
}

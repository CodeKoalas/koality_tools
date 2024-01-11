import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:koality_tools/src/models/gitlab_api/commit.dart';
import 'package:koality_tools/src/models/gitlab_api/pipeline.dart';
import 'package:koality_tools/src/models/gitlab_api/user_profile.dart';

part 'deployment.freezed.dart';
part 'deployment.g.dart';

typedef GitlabArtifactItem = ({
  String fileType,
  int size,
  String filename,
  String? fileFormat,
});

@freezed
class GitlabDeployment with _$GitlabDeployment {
  const GitlabDeployment._();
  const factory GitlabDeployment({
    required String id,
    required String iid,
    String? ref,
    String? sha,
    DateTime? createdAt,
    String? status,
    GitlabUserProfile? user,
    GitlabDeploymentDeployable? deployable,
    @Default(<GitlabArtifactItem>[]) List<GitlabArtifactItem> artifacts,
  }) = _GitlabDeployment;

  factory GitlabDeployment.fromJson(Map<String, dynamic> json) => _$GitlabDeploymentFromJson(json);
}

@freezed
class GitlabDeploymentDeployable with _$GitlabDeploymentDeployable {
  const GitlabDeploymentDeployable._();
  const factory GitlabDeploymentDeployable({
    required String id,
    required String status,
    String? stage,
    String? name,
    String? ref,
    bool? tag,
    double? coverage,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? finishedAt,
    double? duration,
    GitlabUserProfile? user,
    GitlabCommit? commit,
    GitlabPipeline? pipeline,
    String? webUrl,
    DateTime? artifactsExpireAt,
  }) = _GitlabDeploymentDeployable;

  factory GitlabDeploymentDeployable.fromJson(Map<String, dynamic> json) => _$GitlabDeploymentDeployableFromJson(json);
}

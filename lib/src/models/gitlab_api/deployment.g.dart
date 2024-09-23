// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deployment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitlabDeploymentImpl _$$GitlabDeploymentImplFromJson(Map<String, dynamic> json) => _$GitlabDeploymentImpl(
      id: json['id'] as String,
      iid: json['iid'] as String,
      ref: json['ref'] as String?,
      sha: json['sha'] as String?,
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String?,
      user: json['user'] == null ? null : GitlabUserProfile.fromJson(json['user'] as Map<String, dynamic>),
      deployable: json['deployable'] == null
          ? null
          : GitlabDeploymentDeployable.fromJson(json['deployable'] as Map<String, dynamic>),
      artifacts: (json['artifacts'] as List<dynamic>?)
              ?.map((e) => _$recordConvert(
                    e,
                    ($jsonValue) => (
                      fileFormat: $jsonValue['fileFormat'] as String?,
                      fileType: $jsonValue['fileType'] as String,
                      filename: $jsonValue['filename'] as String,
                      size: ($jsonValue['size'] as num).toInt(),
                    ),
                  ))
              .toList() ??
          const <GitlabArtifactItem>[],
    );

Map<String, dynamic> _$$GitlabDeploymentImplToJson(_$GitlabDeploymentImpl instance) => <String, dynamic>{
      'id': instance.id,
      'iid': instance.iid,
      'ref': instance.ref,
      'sha': instance.sha,
      'createdAt': instance.createdAt?.toIso8601String(),
      'status': instance.status,
      'user': instance.user,
      'deployable': instance.deployable,
      'artifacts': instance.artifacts
          .map((e) => <String, dynamic>{
                'fileFormat': e.fileFormat,
                'fileType': e.fileType,
                'filename': e.filename,
                'size': e.size,
              })
          .toList(),
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

_$GitlabDeploymentDeployableImpl _$$GitlabDeploymentDeployableImplFromJson(Map<String, dynamic> json) =>
    _$GitlabDeploymentDeployableImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      stage: json['stage'] as String?,
      name: json['name'] as String?,
      ref: json['ref'] as String?,
      tag: json['tag'] as bool?,
      coverage: (json['coverage'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
      startedAt: json['startedAt'] == null ? null : DateTime.parse(json['startedAt'] as String),
      finishedAt: json['finishedAt'] == null ? null : DateTime.parse(json['finishedAt'] as String),
      duration: (json['duration'] as num?)?.toDouble(),
      user: json['user'] == null ? null : GitlabUserProfile.fromJson(json['user'] as Map<String, dynamic>),
      commit: json['commit'] == null ? null : GitlabCommit.fromJson(json['commit'] as Map<String, dynamic>),
      pipeline: json['pipeline'] == null ? null : GitlabPipeline.fromJson(json['pipeline'] as Map<String, dynamic>),
      webUrl: json['webUrl'] as String?,
      artifactsExpireAt: json['artifactsExpireAt'] == null ? null : DateTime.parse(json['artifactsExpireAt'] as String),
    );

Map<String, dynamic> _$$GitlabDeploymentDeployableImplToJson(_$GitlabDeploymentDeployableImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'stage': instance.stage,
      'name': instance.name,
      'ref': instance.ref,
      'tag': instance.tag,
      'coverage': instance.coverage,
      'createdAt': instance.createdAt?.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'finishedAt': instance.finishedAt?.toIso8601String(),
      'duration': instance.duration,
      'user': instance.user,
      'commit': instance.commit,
      'pipeline': instance.pipeline,
      'webUrl': instance.webUrl,
      'artifactsExpireAt': instance.artifactsExpireAt?.toIso8601String(),
    };

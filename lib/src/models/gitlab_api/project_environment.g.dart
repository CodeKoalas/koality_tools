// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitlabProjectEnvironmentImpl _$$GitlabProjectEnvironmentImplFromJson(Map<String, dynamic> json) =>
    _$GitlabProjectEnvironmentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      state: json['state'] as String?,
      slug: json['slug'] as String?,
      externalUrl: json['externalUrl'] as String?,
      tier: json['tier'] as String?,
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
      enableAdvancedLogsQuerying: json['enableAdvancedLogsQuerying'] as bool?,
      logsApiPath: json['logsApiPath'] as String?,
    );

Map<String, dynamic> _$$GitlabProjectEnvironmentImplToJson(_$GitlabProjectEnvironmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': instance.state,
      'slug': instance.slug,
      'externalUrl': instance.externalUrl,
      'tier': instance.tier,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'enableAdvancedLogsQuerying': instance.enableAdvancedLogsQuerying,
      'logsApiPath': instance.logsApiPath,
    };

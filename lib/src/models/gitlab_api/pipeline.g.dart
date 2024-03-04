// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pipeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitlabPipelineImpl _$$GitlabPipelineImplFromJson(Map<String, dynamic> json) =>
    _$GitlabPipelineImpl(
      id: json['id'] as String,
      sha: json['sha'] as String,
      ref: json['ref'] as String,
      status: json['status'] as String,
      webUrl: json['webUrl'] as String? ?? '',
    );

Map<String, dynamic> _$$GitlabPipelineImplToJson(
        _$GitlabPipelineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sha': instance.sha,
      'ref': instance.ref,
      'status': instance.status,
      'webUrl': instance.webUrl,
    };

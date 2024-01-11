// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GitlabProjectVariableImpl _$$GitlabProjectVariableImplFromJson(Map<String, dynamic> json) =>
    _$GitlabProjectVariableImpl(
      id: json['id'] as String,
      key: json['key'] as String,
      value: json['value'] as String,
      protected: json['protected'] as bool? ?? false,
      masked: json['masked'] as bool? ?? false,
      raw: json['raw'] as bool? ?? false,
      environmentScope: json['environmentScope'] as String? ?? '*',
      variableType: $enumDecodeNullable(_$GitlabProjectVariableTypeEnumMap, json['variableType']),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$GitlabProjectVariableImplToJson(_$GitlabProjectVariableImpl instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'value': instance.value,
      'protected': instance.protected,
      'masked': instance.masked,
      'raw': instance.raw,
      'environmentScope': instance.environmentScope,
      'variableType': _$GitlabProjectVariableTypeEnumMap[instance.variableType],
      'description': instance.description,
    };

const _$GitlabProjectVariableTypeEnumMap = {
  GitlabProjectVariableType.envVar: 'envVar',
  GitlabProjectVariableType.file: 'file',
};

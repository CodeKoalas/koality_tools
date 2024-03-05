// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultSuccessImpl<T> _$$ResultSuccessImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ResultSuccessImpl<T>(
      fromJsonT(json['data']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ResultSuccessImplToJson<T>(
  _$ResultSuccessImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'runtimeType': instance.$type,
    };

_$ResultFailureImpl<T> _$$ResultFailureImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ResultFailureImpl<T>(
      fauxValueFromJson(json['error']),
      fauxValueFromJson(json['trace']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ResultFailureImplToJson<T>(
  _$ResultFailureImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error': valueToJsonString(instance.error),
      'runtimeType': instance.$type,
    };

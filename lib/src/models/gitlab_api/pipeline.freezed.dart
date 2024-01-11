// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pipeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GitlabPipeline _$GitlabPipelineFromJson(Map<String, dynamic> json) {
  return _GitlabPipeline.fromJson(json);
}

/// @nodoc
mixin _$GitlabPipeline {
  String get id => throw _privateConstructorUsedError;
  String get sha => throw _privateConstructorUsedError;
  String get ref => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get webUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GitlabPipelineCopyWith<GitlabPipeline> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitlabPipelineCopyWith<$Res> {
  factory $GitlabPipelineCopyWith(GitlabPipeline value, $Res Function(GitlabPipeline) then) =
      _$GitlabPipelineCopyWithImpl<$Res, GitlabPipeline>;
  @useResult
  $Res call({String id, String sha, String ref, String status, String webUrl});
}

/// @nodoc
class _$GitlabPipelineCopyWithImpl<$Res, $Val extends GitlabPipeline> implements $GitlabPipelineCopyWith<$Res> {
  _$GitlabPipelineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sha = null,
    Object? ref = null,
    Object? status = null,
    Object? webUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sha: null == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      webUrl: null == webUrl
          ? _value.webUrl
          : webUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GitlabPipelineImplCopyWith<$Res> implements $GitlabPipelineCopyWith<$Res> {
  factory _$$GitlabPipelineImplCopyWith(_$GitlabPipelineImpl value, $Res Function(_$GitlabPipelineImpl) then) =
      __$$GitlabPipelineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String sha, String ref, String status, String webUrl});
}

/// @nodoc
class __$$GitlabPipelineImplCopyWithImpl<$Res> extends _$GitlabPipelineCopyWithImpl<$Res, _$GitlabPipelineImpl>
    implements _$$GitlabPipelineImplCopyWith<$Res> {
  __$$GitlabPipelineImplCopyWithImpl(_$GitlabPipelineImpl _value, $Res Function(_$GitlabPipelineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sha = null,
    Object? ref = null,
    Object? status = null,
    Object? webUrl = null,
  }) {
    return _then(_$GitlabPipelineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      sha: null == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      webUrl: null == webUrl
          ? _value.webUrl
          : webUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitlabPipelineImpl extends _GitlabPipeline {
  const _$GitlabPipelineImpl(
      {required this.id, required this.sha, required this.ref, required this.status, this.webUrl = ''})
      : super._();

  factory _$GitlabPipelineImpl.fromJson(Map<String, dynamic> json) => _$$GitlabPipelineImplFromJson(json);

  @override
  final String id;
  @override
  final String sha;
  @override
  final String ref;
  @override
  final String status;
  @override
  @JsonKey()
  final String webUrl;

  @override
  String toString() {
    return 'GitlabPipeline(id: $id, sha: $sha, ref: $ref, status: $status, webUrl: $webUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitlabPipelineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sha, sha) || other.sha == sha) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.webUrl, webUrl) || other.webUrl == webUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, sha, ref, status, webUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GitlabPipelineImplCopyWith<_$GitlabPipelineImpl> get copyWith =>
      __$$GitlabPipelineImplCopyWithImpl<_$GitlabPipelineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitlabPipelineImplToJson(
      this,
    );
  }
}

abstract class _GitlabPipeline extends GitlabPipeline {
  const factory _GitlabPipeline(
      {required final String id,
      required final String sha,
      required final String ref,
      required final String status,
      final String webUrl}) = _$GitlabPipelineImpl;
  const _GitlabPipeline._() : super._();

  factory _GitlabPipeline.fromJson(Map<String, dynamic> json) = _$GitlabPipelineImpl.fromJson;

  @override
  String get id;
  @override
  String get sha;
  @override
  String get ref;
  @override
  String get status;
  @override
  String get webUrl;
  @override
  @JsonKey(ignore: true)
  _$$GitlabPipelineImplCopyWith<_$GitlabPipelineImpl> get copyWith => throw _privateConstructorUsedError;
}

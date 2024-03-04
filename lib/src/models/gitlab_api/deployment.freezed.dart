// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deployment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GitlabDeployment _$GitlabDeploymentFromJson(Map<String, dynamic> json) {
  return _GitlabDeployment.fromJson(json);
}

/// @nodoc
mixin _$GitlabDeployment {
  String get id => throw _privateConstructorUsedError;
  String get iid => throw _privateConstructorUsedError;
  String? get ref => throw _privateConstructorUsedError;
  String? get sha => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  GitlabUserProfile? get user => throw _privateConstructorUsedError;
  GitlabDeploymentDeployable? get deployable =>
      throw _privateConstructorUsedError;
  List<({String? fileFormat, String fileType, String filename, int size})>
      get artifacts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GitlabDeploymentCopyWith<GitlabDeployment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitlabDeploymentCopyWith<$Res> {
  factory $GitlabDeploymentCopyWith(
          GitlabDeployment value, $Res Function(GitlabDeployment) then) =
      _$GitlabDeploymentCopyWithImpl<$Res, GitlabDeployment>;
  @useResult
  $Res call(
      {String id,
      String iid,
      String? ref,
      String? sha,
      DateTime? createdAt,
      String? status,
      GitlabUserProfile? user,
      GitlabDeploymentDeployable? deployable,
      List<({String? fileFormat, String fileType, String filename, int size})>
          artifacts});

  $GitlabUserProfileCopyWith<$Res>? get user;
  $GitlabDeploymentDeployableCopyWith<$Res>? get deployable;
}

/// @nodoc
class _$GitlabDeploymentCopyWithImpl<$Res, $Val extends GitlabDeployment>
    implements $GitlabDeploymentCopyWith<$Res> {
  _$GitlabDeploymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iid = null,
    Object? ref = freezed,
    Object? sha = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
    Object? user = freezed,
    Object? deployable = freezed,
    Object? artifacts = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      iid: null == iid
          ? _value.iid
          : iid // ignore: cast_nullable_to_non_nullable
              as String,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String?,
      sha: freezed == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as GitlabUserProfile?,
      deployable: freezed == deployable
          ? _value.deployable
          : deployable // ignore: cast_nullable_to_non_nullable
              as GitlabDeploymentDeployable?,
      artifacts: null == artifacts
          ? _value.artifacts
          : artifacts // ignore: cast_nullable_to_non_nullable
              as List<
                  ({
                    String? fileFormat,
                    String fileType,
                    String filename,
                    int size
                  })>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GitlabUserProfileCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $GitlabUserProfileCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GitlabDeploymentDeployableCopyWith<$Res>? get deployable {
    if (_value.deployable == null) {
      return null;
    }

    return $GitlabDeploymentDeployableCopyWith<$Res>(_value.deployable!,
        (value) {
      return _then(_value.copyWith(deployable: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GitlabDeploymentImplCopyWith<$Res>
    implements $GitlabDeploymentCopyWith<$Res> {
  factory _$$GitlabDeploymentImplCopyWith(_$GitlabDeploymentImpl value,
          $Res Function(_$GitlabDeploymentImpl) then) =
      __$$GitlabDeploymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String iid,
      String? ref,
      String? sha,
      DateTime? createdAt,
      String? status,
      GitlabUserProfile? user,
      GitlabDeploymentDeployable? deployable,
      List<({String? fileFormat, String fileType, String filename, int size})>
          artifacts});

  @override
  $GitlabUserProfileCopyWith<$Res>? get user;
  @override
  $GitlabDeploymentDeployableCopyWith<$Res>? get deployable;
}

/// @nodoc
class __$$GitlabDeploymentImplCopyWithImpl<$Res>
    extends _$GitlabDeploymentCopyWithImpl<$Res, _$GitlabDeploymentImpl>
    implements _$$GitlabDeploymentImplCopyWith<$Res> {
  __$$GitlabDeploymentImplCopyWithImpl(_$GitlabDeploymentImpl _value,
      $Res Function(_$GitlabDeploymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? iid = null,
    Object? ref = freezed,
    Object? sha = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
    Object? user = freezed,
    Object? deployable = freezed,
    Object? artifacts = null,
  }) {
    return _then(_$GitlabDeploymentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      iid: null == iid
          ? _value.iid
          : iid // ignore: cast_nullable_to_non_nullable
              as String,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String?,
      sha: freezed == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as GitlabUserProfile?,
      deployable: freezed == deployable
          ? _value.deployable
          : deployable // ignore: cast_nullable_to_non_nullable
              as GitlabDeploymentDeployable?,
      artifacts: null == artifacts
          ? _value._artifacts
          : artifacts // ignore: cast_nullable_to_non_nullable
              as List<
                  ({
                    String? fileFormat,
                    String fileType,
                    String filename,
                    int size
                  })>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitlabDeploymentImpl extends _GitlabDeployment {
  const _$GitlabDeploymentImpl(
      {required this.id,
      required this.iid,
      this.ref,
      this.sha,
      this.createdAt,
      this.status,
      this.user,
      this.deployable,
      final List<
              ({
                String? fileFormat,
                String fileType,
                String filename,
                int size
              })>
          artifacts = const <GitlabArtifactItem>[]})
      : _artifacts = artifacts,
        super._();

  factory _$GitlabDeploymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$GitlabDeploymentImplFromJson(json);

  @override
  final String id;
  @override
  final String iid;
  @override
  final String? ref;
  @override
  final String? sha;
  @override
  final DateTime? createdAt;
  @override
  final String? status;
  @override
  final GitlabUserProfile? user;
  @override
  final GitlabDeploymentDeployable? deployable;
  final List<({String? fileFormat, String fileType, String filename, int size})>
      _artifacts;
  @override
  @JsonKey()
  List<({String? fileFormat, String fileType, String filename, int size})>
      get artifacts {
    if (_artifacts is EqualUnmodifiableListView) return _artifacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artifacts);
  }

  @override
  String toString() {
    return 'GitlabDeployment(id: $id, iid: $iid, ref: $ref, sha: $sha, createdAt: $createdAt, status: $status, user: $user, deployable: $deployable, artifacts: $artifacts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitlabDeploymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.iid, iid) || other.iid == iid) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.sha, sha) || other.sha == sha) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.deployable, deployable) ||
                other.deployable == deployable) &&
            const DeepCollectionEquality()
                .equals(other._artifacts, _artifacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      iid,
      ref,
      sha,
      createdAt,
      status,
      user,
      deployable,
      const DeepCollectionEquality().hash(_artifacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GitlabDeploymentImplCopyWith<_$GitlabDeploymentImpl> get copyWith =>
      __$$GitlabDeploymentImplCopyWithImpl<_$GitlabDeploymentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitlabDeploymentImplToJson(
      this,
    );
  }
}

abstract class _GitlabDeployment extends GitlabDeployment {
  const factory _GitlabDeployment(
      {required final String id,
      required final String iid,
      final String? ref,
      final String? sha,
      final DateTime? createdAt,
      final String? status,
      final GitlabUserProfile? user,
      final GitlabDeploymentDeployable? deployable,
      final List<
              ({
                String? fileFormat,
                String fileType,
                String filename,
                int size
              })>
          artifacts}) = _$GitlabDeploymentImpl;
  const _GitlabDeployment._() : super._();

  factory _GitlabDeployment.fromJson(Map<String, dynamic> json) =
      _$GitlabDeploymentImpl.fromJson;

  @override
  String get id;
  @override
  String get iid;
  @override
  String? get ref;
  @override
  String? get sha;
  @override
  DateTime? get createdAt;
  @override
  String? get status;
  @override
  GitlabUserProfile? get user;
  @override
  GitlabDeploymentDeployable? get deployable;
  @override
  List<({String? fileFormat, String fileType, String filename, int size})>
      get artifacts;
  @override
  @JsonKey(ignore: true)
  _$$GitlabDeploymentImplCopyWith<_$GitlabDeploymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GitlabDeploymentDeployable _$GitlabDeploymentDeployableFromJson(
    Map<String, dynamic> json) {
  return _GitlabDeploymentDeployable.fromJson(json);
}

/// @nodoc
mixin _$GitlabDeploymentDeployable {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get stage => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get ref => throw _privateConstructorUsedError;
  bool? get tag => throw _privateConstructorUsedError;
  double? get coverage => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get finishedAt => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  GitlabUserProfile? get user => throw _privateConstructorUsedError;
  GitlabCommit? get commit => throw _privateConstructorUsedError;
  GitlabPipeline? get pipeline => throw _privateConstructorUsedError;
  String? get webUrl => throw _privateConstructorUsedError;
  DateTime? get artifactsExpireAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GitlabDeploymentDeployableCopyWith<GitlabDeploymentDeployable>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitlabDeploymentDeployableCopyWith<$Res> {
  factory $GitlabDeploymentDeployableCopyWith(GitlabDeploymentDeployable value,
          $Res Function(GitlabDeploymentDeployable) then) =
      _$GitlabDeploymentDeployableCopyWithImpl<$Res,
          GitlabDeploymentDeployable>;
  @useResult
  $Res call(
      {String id,
      String status,
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
      DateTime? artifactsExpireAt});

  $GitlabUserProfileCopyWith<$Res>? get user;
  $GitlabCommitCopyWith<$Res>? get commit;
  $GitlabPipelineCopyWith<$Res>? get pipeline;
}

/// @nodoc
class _$GitlabDeploymentDeployableCopyWithImpl<$Res,
        $Val extends GitlabDeploymentDeployable>
    implements $GitlabDeploymentDeployableCopyWith<$Res> {
  _$GitlabDeploymentDeployableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? stage = freezed,
    Object? name = freezed,
    Object? ref = freezed,
    Object? tag = freezed,
    Object? coverage = freezed,
    Object? createdAt = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? duration = freezed,
    Object? user = freezed,
    Object? commit = freezed,
    Object? pipeline = freezed,
    Object? webUrl = freezed,
    Object? artifactsExpireAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as bool?,
      coverage: freezed == coverage
          ? _value.coverage
          : coverage // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as GitlabUserProfile?,
      commit: freezed == commit
          ? _value.commit
          : commit // ignore: cast_nullable_to_non_nullable
              as GitlabCommit?,
      pipeline: freezed == pipeline
          ? _value.pipeline
          : pipeline // ignore: cast_nullable_to_non_nullable
              as GitlabPipeline?,
      webUrl: freezed == webUrl
          ? _value.webUrl
          : webUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      artifactsExpireAt: freezed == artifactsExpireAt
          ? _value.artifactsExpireAt
          : artifactsExpireAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GitlabUserProfileCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $GitlabUserProfileCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GitlabCommitCopyWith<$Res>? get commit {
    if (_value.commit == null) {
      return null;
    }

    return $GitlabCommitCopyWith<$Res>(_value.commit!, (value) {
      return _then(_value.copyWith(commit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GitlabPipelineCopyWith<$Res>? get pipeline {
    if (_value.pipeline == null) {
      return null;
    }

    return $GitlabPipelineCopyWith<$Res>(_value.pipeline!, (value) {
      return _then(_value.copyWith(pipeline: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GitlabDeploymentDeployableImplCopyWith<$Res>
    implements $GitlabDeploymentDeployableCopyWith<$Res> {
  factory _$$GitlabDeploymentDeployableImplCopyWith(
          _$GitlabDeploymentDeployableImpl value,
          $Res Function(_$GitlabDeploymentDeployableImpl) then) =
      __$$GitlabDeploymentDeployableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
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
      DateTime? artifactsExpireAt});

  @override
  $GitlabUserProfileCopyWith<$Res>? get user;
  @override
  $GitlabCommitCopyWith<$Res>? get commit;
  @override
  $GitlabPipelineCopyWith<$Res>? get pipeline;
}

/// @nodoc
class __$$GitlabDeploymentDeployableImplCopyWithImpl<$Res>
    extends _$GitlabDeploymentDeployableCopyWithImpl<$Res,
        _$GitlabDeploymentDeployableImpl>
    implements _$$GitlabDeploymentDeployableImplCopyWith<$Res> {
  __$$GitlabDeploymentDeployableImplCopyWithImpl(
      _$GitlabDeploymentDeployableImpl _value,
      $Res Function(_$GitlabDeploymentDeployableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? stage = freezed,
    Object? name = freezed,
    Object? ref = freezed,
    Object? tag = freezed,
    Object? coverage = freezed,
    Object? createdAt = freezed,
    Object? startedAt = freezed,
    Object? finishedAt = freezed,
    Object? duration = freezed,
    Object? user = freezed,
    Object? commit = freezed,
    Object? pipeline = freezed,
    Object? webUrl = freezed,
    Object? artifactsExpireAt = freezed,
  }) {
    return _then(_$GitlabDeploymentDeployableImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      stage: freezed == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as bool?,
      coverage: freezed == coverage
          ? _value.coverage
          : coverage // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as GitlabUserProfile?,
      commit: freezed == commit
          ? _value.commit
          : commit // ignore: cast_nullable_to_non_nullable
              as GitlabCommit?,
      pipeline: freezed == pipeline
          ? _value.pipeline
          : pipeline // ignore: cast_nullable_to_non_nullable
              as GitlabPipeline?,
      webUrl: freezed == webUrl
          ? _value.webUrl
          : webUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      artifactsExpireAt: freezed == artifactsExpireAt
          ? _value.artifactsExpireAt
          : artifactsExpireAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitlabDeploymentDeployableImpl extends _GitlabDeploymentDeployable {
  const _$GitlabDeploymentDeployableImpl(
      {required this.id,
      required this.status,
      this.stage,
      this.name,
      this.ref,
      this.tag,
      this.coverage,
      this.createdAt,
      this.startedAt,
      this.finishedAt,
      this.duration,
      this.user,
      this.commit,
      this.pipeline,
      this.webUrl,
      this.artifactsExpireAt})
      : super._();

  factory _$GitlabDeploymentDeployableImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GitlabDeploymentDeployableImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String? stage;
  @override
  final String? name;
  @override
  final String? ref;
  @override
  final bool? tag;
  @override
  final double? coverage;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? finishedAt;
  @override
  final double? duration;
  @override
  final GitlabUserProfile? user;
  @override
  final GitlabCommit? commit;
  @override
  final GitlabPipeline? pipeline;
  @override
  final String? webUrl;
  @override
  final DateTime? artifactsExpireAt;

  @override
  String toString() {
    return 'GitlabDeploymentDeployable(id: $id, status: $status, stage: $stage, name: $name, ref: $ref, tag: $tag, coverage: $coverage, createdAt: $createdAt, startedAt: $startedAt, finishedAt: $finishedAt, duration: $duration, user: $user, commit: $commit, pipeline: $pipeline, webUrl: $webUrl, artifactsExpireAt: $artifactsExpireAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitlabDeploymentDeployableImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.coverage, coverage) ||
                other.coverage == coverage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.commit, commit) || other.commit == commit) &&
            (identical(other.pipeline, pipeline) ||
                other.pipeline == pipeline) &&
            (identical(other.webUrl, webUrl) || other.webUrl == webUrl) &&
            (identical(other.artifactsExpireAt, artifactsExpireAt) ||
                other.artifactsExpireAt == artifactsExpireAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      stage,
      name,
      ref,
      tag,
      coverage,
      createdAt,
      startedAt,
      finishedAt,
      duration,
      user,
      commit,
      pipeline,
      webUrl,
      artifactsExpireAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GitlabDeploymentDeployableImplCopyWith<_$GitlabDeploymentDeployableImpl>
      get copyWith => __$$GitlabDeploymentDeployableImplCopyWithImpl<
          _$GitlabDeploymentDeployableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitlabDeploymentDeployableImplToJson(
      this,
    );
  }
}

abstract class _GitlabDeploymentDeployable extends GitlabDeploymentDeployable {
  const factory _GitlabDeploymentDeployable(
      {required final String id,
      required final String status,
      final String? stage,
      final String? name,
      final String? ref,
      final bool? tag,
      final double? coverage,
      final DateTime? createdAt,
      final DateTime? startedAt,
      final DateTime? finishedAt,
      final double? duration,
      final GitlabUserProfile? user,
      final GitlabCommit? commit,
      final GitlabPipeline? pipeline,
      final String? webUrl,
      final DateTime? artifactsExpireAt}) = _$GitlabDeploymentDeployableImpl;
  const _GitlabDeploymentDeployable._() : super._();

  factory _GitlabDeploymentDeployable.fromJson(Map<String, dynamic> json) =
      _$GitlabDeploymentDeployableImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String? get stage;
  @override
  String? get name;
  @override
  String? get ref;
  @override
  bool? get tag;
  @override
  double? get coverage;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get finishedAt;
  @override
  double? get duration;
  @override
  GitlabUserProfile? get user;
  @override
  GitlabCommit? get commit;
  @override
  GitlabPipeline? get pipeline;
  @override
  String? get webUrl;
  @override
  DateTime? get artifactsExpireAt;
  @override
  @JsonKey(ignore: true)
  _$$GitlabDeploymentDeployableImplCopyWith<_$GitlabDeploymentDeployableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

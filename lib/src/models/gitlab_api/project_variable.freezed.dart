// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_variable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GitlabProjectVariable _$GitlabProjectVariableFromJson(Map<String, dynamic> json) {
  return _GitlabProjectVariable.fromJson(json);
}

/// @nodoc
mixin _$GitlabProjectVariable {
  String get key => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  bool get protected => throw _privateConstructorUsedError;
  bool get masked => throw _privateConstructorUsedError;
  bool get raw => throw _privateConstructorUsedError;
  String get environmentScope => throw _privateConstructorUsedError;
  GitlabProjectVariableType? get variableType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GitlabProjectVariableCopyWith<GitlabProjectVariable> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitlabProjectVariableCopyWith<$Res> {
  factory $GitlabProjectVariableCopyWith(GitlabProjectVariable value, $Res Function(GitlabProjectVariable) then) =
      _$GitlabProjectVariableCopyWithImpl<$Res, GitlabProjectVariable>;
  @useResult
  $Res call(
      {String key,
      String value,
      bool protected,
      bool masked,
      bool raw,
      String environmentScope,
      GitlabProjectVariableType? variableType,
      String? description});
}

/// @nodoc
class _$GitlabProjectVariableCopyWithImpl<$Res, $Val extends GitlabProjectVariable>
    implements $GitlabProjectVariableCopyWith<$Res> {
  _$GitlabProjectVariableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
    Object? protected = null,
    Object? masked = null,
    Object? raw = null,
    Object? environmentScope = null,
    Object? variableType = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      protected: null == protected
          ? _value.protected
          : protected // ignore: cast_nullable_to_non_nullable
              as bool,
      masked: null == masked
          ? _value.masked
          : masked // ignore: cast_nullable_to_non_nullable
              as bool,
      raw: null == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as bool,
      environmentScope: null == environmentScope
          ? _value.environmentScope
          : environmentScope // ignore: cast_nullable_to_non_nullable
              as String,
      variableType: freezed == variableType
          ? _value.variableType
          : variableType // ignore: cast_nullable_to_non_nullable
              as GitlabProjectVariableType?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GitlabProjectVariableImplCopyWith<$Res> implements $GitlabProjectVariableCopyWith<$Res> {
  factory _$$GitlabProjectVariableImplCopyWith(
          _$GitlabProjectVariableImpl value, $Res Function(_$GitlabProjectVariableImpl) then) =
      __$$GitlabProjectVariableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String value,
      bool protected,
      bool masked,
      bool raw,
      String environmentScope,
      GitlabProjectVariableType? variableType,
      String? description});
}

/// @nodoc
class __$$GitlabProjectVariableImplCopyWithImpl<$Res>
    extends _$GitlabProjectVariableCopyWithImpl<$Res, _$GitlabProjectVariableImpl>
    implements _$$GitlabProjectVariableImplCopyWith<$Res> {
  __$$GitlabProjectVariableImplCopyWithImpl(
      _$GitlabProjectVariableImpl _value, $Res Function(_$GitlabProjectVariableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = null,
    Object? protected = null,
    Object? masked = null,
    Object? raw = null,
    Object? environmentScope = null,
    Object? variableType = freezed,
    Object? description = freezed,
  }) {
    return _then(_$GitlabProjectVariableImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      protected: null == protected
          ? _value.protected
          : protected // ignore: cast_nullable_to_non_nullable
              as bool,
      masked: null == masked
          ? _value.masked
          : masked // ignore: cast_nullable_to_non_nullable
              as bool,
      raw: null == raw
          ? _value.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as bool,
      environmentScope: null == environmentScope
          ? _value.environmentScope
          : environmentScope // ignore: cast_nullable_to_non_nullable
              as String,
      variableType: freezed == variableType
          ? _value.variableType
          : variableType // ignore: cast_nullable_to_non_nullable
              as GitlabProjectVariableType?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitlabProjectVariableImpl extends _GitlabProjectVariable {
  const _$GitlabProjectVariableImpl(
      {required this.key,
      required this.value,
      this.protected = false,
      this.masked = false,
      this.raw = false,
      this.environmentScope = '*',
      this.variableType,
      this.description})
      : super._();

  factory _$GitlabProjectVariableImpl.fromJson(Map<String, dynamic> json) => _$$GitlabProjectVariableImplFromJson(json);

  @override
  final String key;
  @override
  final String value;
  @override
  @JsonKey()
  final bool protected;
  @override
  @JsonKey()
  final bool masked;
  @override
  @JsonKey()
  final bool raw;
  @override
  @JsonKey()
  final String environmentScope;
  @override
  final GitlabProjectVariableType? variableType;
  @override
  final String? description;

  @override
  String toString() {
    return 'GitlabProjectVariable(key: $key, value: $value, protected: $protected, masked: $masked, raw: $raw, environmentScope: $environmentScope, variableType: $variableType, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitlabProjectVariableImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.protected, protected) || other.protected == protected) &&
            (identical(other.masked, masked) || other.masked == masked) &&
            (identical(other.raw, raw) || other.raw == raw) &&
            (identical(other.environmentScope, environmentScope) || other.environmentScope == environmentScope) &&
            (identical(other.variableType, variableType) || other.variableType == variableType) &&
            (identical(other.description, description) || other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, key, value, protected, masked, raw, environmentScope, variableType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GitlabProjectVariableImplCopyWith<_$GitlabProjectVariableImpl> get copyWith =>
      __$$GitlabProjectVariableImplCopyWithImpl<_$GitlabProjectVariableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitlabProjectVariableImplToJson(
      this,
    );
  }
}

abstract class _GitlabProjectVariable extends GitlabProjectVariable {
  const factory _GitlabProjectVariable(
      {required final String key,
      required final String value,
      final bool protected,
      final bool masked,
      final bool raw,
      final String environmentScope,
      final GitlabProjectVariableType? variableType,
      final String? description}) = _$GitlabProjectVariableImpl;
  const _GitlabProjectVariable._() : super._();

  factory _GitlabProjectVariable.fromJson(Map<String, dynamic> json) = _$GitlabProjectVariableImpl.fromJson;

  @override
  String get key;
  @override
  String get value;
  @override
  bool get protected;
  @override
  bool get masked;
  @override
  bool get raw;
  @override
  String get environmentScope;
  @override
  GitlabProjectVariableType? get variableType;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$GitlabProjectVariableImplCopyWith<_$GitlabProjectVariableImpl> get copyWith => throw _privateConstructorUsedError;
}

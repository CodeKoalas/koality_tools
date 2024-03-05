// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Result<T> _$ResultFromJson<T>(Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  switch (json['runtimeType']) {
    case 'success':
      return ResultSuccess<T>.fromJson(json, fromJsonT);
    case 'failure':
      return ResultFailure<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Result', 'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Result<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
            @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
            @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
            @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultSuccess<T> value) success,
    required TResult Function(ResultFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultSuccess<T> value)? success,
    TResult? Function(ResultFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultSuccess<T> value)? success,
    TResult Function(ResultFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) = _$ResultCopyWithImpl<T, $Res, Result<T>>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, $Res, $Val extends Result<T>> implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResultSuccessImplCopyWith<T, $Res> {
  factory _$$ResultSuccessImplCopyWith(_$ResultSuccessImpl<T> value, $Res Function(_$ResultSuccessImpl<T>) then) =
      __$$ResultSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ResultSuccessImplCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res, _$ResultSuccessImpl<T>>
    implements _$$ResultSuccessImplCopyWith<T, $Res> {
  __$$ResultSuccessImplCopyWithImpl(_$ResultSuccessImpl<T> _value, $Res Function(_$ResultSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResultSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ResultSuccessImpl<T> extends ResultSuccess<T> {
  const _$ResultSuccessImpl(this.data, {final String? $type})
      : $type = $type ?? 'success',
        super._();

  factory _$ResultSuccessImpl.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ResultSuccessImplFromJson(json, fromJsonT);

  @override
  final T data;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Result<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultSuccessImplCopyWith<T, _$ResultSuccessImpl<T>> get copyWith =>
      __$$ResultSuccessImplCopyWithImpl<T, _$ResultSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
            @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace)
        failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
            @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace)?
        failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
            @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace)?
        failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultSuccess<T> value) success,
    required TResult Function(ResultFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultSuccess<T> value)? success,
    TResult? Function(ResultFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultSuccess<T> value)? success,
    TResult Function(ResultFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ResultSuccessImplToJson<T>(this, toJsonT);
  }
}

abstract class ResultSuccess<T> extends Result<T> {
  const factory ResultSuccess(final T data) = _$ResultSuccessImpl<T>;
  const ResultSuccess._() : super._();

  factory ResultSuccess.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ResultSuccessImpl<T>.fromJson;

  T get data;
  @JsonKey(ignore: true)
  _$$ResultSuccessImplCopyWith<T, _$ResultSuccessImpl<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultFailureImplCopyWith<T, $Res> {
  factory _$$ResultFailureImplCopyWith(_$ResultFailureImpl<T> value, $Res Function(_$ResultFailureImpl<T>) then) =
      __$$ResultFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
      @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace});
}

/// @nodoc
class __$$ResultFailureImplCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res, _$ResultFailureImpl<T>>
    implements _$$ResultFailureImplCopyWith<T, $Res> {
  __$$ResultFailureImplCopyWithImpl(_$ResultFailureImpl<T> _value, $Res Function(_$ResultFailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? trace = freezed,
  }) {
    return _then(_$ResultFailureImpl<T>(
      freezed == error ? _value.error : error,
      freezed == trace
          ? _value.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ResultFailureImpl<T> extends ResultFailure<T> {
  const _$ResultFailureImpl(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) this.error,
      @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) this.trace,
      {final String? $type})
      : $type = $type ?? 'failure',
        super._();

  factory _$ResultFailureImpl.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ResultFailureImplFromJson(json, fromJsonT);

  @override
  @JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString)
  final Object? error;
  @override
  @JsonKey(includeToJson: false, fromJson: fauxValueFromJson)
  final StackTrace? trace;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Result<$T>.failure(error: $error, trace: $trace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultFailureImpl<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.trace, trace) || other.trace == trace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(error), trace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultFailureImplCopyWith<T, _$ResultFailureImpl<T>> get copyWith =>
      __$$ResultFailureImplCopyWithImpl<T, _$ResultFailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
            @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace)
        failure,
  }) {
    return failure(error, trace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
            @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace)?
        failure,
  }) {
    return failure?.call(error, trace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) Object? error,
            @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) StackTrace? trace)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error, trace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultSuccess<T> value) success,
    required TResult Function(ResultFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultSuccess<T> value)? success,
    TResult? Function(ResultFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultSuccess<T> value)? success,
    TResult Function(ResultFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ResultFailureImplToJson<T>(this, toJsonT);
  }
}

abstract class ResultFailure<T> extends Result<T> {
  const factory ResultFailure(@JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString) final Object? error,
      @JsonKey(includeToJson: false, fromJson: fauxValueFromJson) final StackTrace? trace) = _$ResultFailureImpl<T>;
  const ResultFailure._() : super._();

  factory ResultFailure.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ResultFailureImpl<T>.fromJson;

  @JsonKey(fromJson: fauxValueFromJson, toJson: valueToJsonString)
  Object? get error;
  @JsonKey(includeToJson: false, fromJson: fauxValueFromJson)
  StackTrace? get trace;
  @JsonKey(ignore: true)
  _$$ResultFailureImplCopyWith<T, _$ResultFailureImpl<T>> get copyWith => throw _privateConstructorUsedError;
}

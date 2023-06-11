// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KoalityConfig _$KoalityConfigFromJson(Map<String, dynamic> json) {
  return _KoalityConfig.fromJson(json);
}

/// @nodoc
mixin _$KoalityConfig {
  String get configPath => throw _privateConstructorUsedError;
  KubectlConfig get kubectlConfig => throw _privateConstructorUsedError;
  String? get gitlabAccessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KoalityConfigCopyWith<KoalityConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KoalityConfigCopyWith<$Res> {
  factory $KoalityConfigCopyWith(
          KoalityConfig value, $Res Function(KoalityConfig) then) =
      _$KoalityConfigCopyWithImpl<$Res, KoalityConfig>;
  @useResult
  $Res call(
      {String configPath,
      KubectlConfig kubectlConfig,
      String? gitlabAccessToken});

  $KubectlConfigCopyWith<$Res> get kubectlConfig;
}

/// @nodoc
class _$KoalityConfigCopyWithImpl<$Res, $Val extends KoalityConfig>
    implements $KoalityConfigCopyWith<$Res> {
  _$KoalityConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configPath = null,
    Object? kubectlConfig = null,
    Object? gitlabAccessToken = freezed,
  }) {
    return _then(_value.copyWith(
      configPath: null == configPath
          ? _value.configPath
          : configPath // ignore: cast_nullable_to_non_nullable
              as String,
      kubectlConfig: null == kubectlConfig
          ? _value.kubectlConfig
          : kubectlConfig // ignore: cast_nullable_to_non_nullable
              as KubectlConfig,
      gitlabAccessToken: freezed == gitlabAccessToken
          ? _value.gitlabAccessToken
          : gitlabAccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KubectlConfigCopyWith<$Res> get kubectlConfig {
    return $KubectlConfigCopyWith<$Res>(_value.kubectlConfig, (value) {
      return _then(_value.copyWith(kubectlConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_KoalityConfigCopyWith<$Res>
    implements $KoalityConfigCopyWith<$Res> {
  factory _$$_KoalityConfigCopyWith(
          _$_KoalityConfig value, $Res Function(_$_KoalityConfig) then) =
      __$$_KoalityConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String configPath,
      KubectlConfig kubectlConfig,
      String? gitlabAccessToken});

  @override
  $KubectlConfigCopyWith<$Res> get kubectlConfig;
}

/// @nodoc
class __$$_KoalityConfigCopyWithImpl<$Res>
    extends _$KoalityConfigCopyWithImpl<$Res, _$_KoalityConfig>
    implements _$$_KoalityConfigCopyWith<$Res> {
  __$$_KoalityConfigCopyWithImpl(
      _$_KoalityConfig _value, $Res Function(_$_KoalityConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configPath = null,
    Object? kubectlConfig = null,
    Object? gitlabAccessToken = freezed,
  }) {
    return _then(_$_KoalityConfig(
      configPath: null == configPath
          ? _value.configPath
          : configPath // ignore: cast_nullable_to_non_nullable
              as String,
      kubectlConfig: null == kubectlConfig
          ? _value.kubectlConfig
          : kubectlConfig // ignore: cast_nullable_to_non_nullable
              as KubectlConfig,
      gitlabAccessToken: freezed == gitlabAccessToken
          ? _value.gitlabAccessToken
          : gitlabAccessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KoalityConfig extends _KoalityConfig {
  const _$_KoalityConfig(
      {required this.configPath,
      this.kubectlConfig = const KubectlConfig(),
      this.gitlabAccessToken})
      : super._();

  factory _$_KoalityConfig.fromJson(Map<String, dynamic> json) =>
      _$$_KoalityConfigFromJson(json);

  @override
  final String configPath;
  @override
  @JsonKey()
  final KubectlConfig kubectlConfig;
  @override
  final String? gitlabAccessToken;

  @override
  String toString() {
    return 'KoalityConfig(configPath: $configPath, kubectlConfig: $kubectlConfig, gitlabAccessToken: $gitlabAccessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KoalityConfig &&
            (identical(other.configPath, configPath) ||
                other.configPath == configPath) &&
            (identical(other.kubectlConfig, kubectlConfig) ||
                other.kubectlConfig == kubectlConfig) &&
            (identical(other.gitlabAccessToken, gitlabAccessToken) ||
                other.gitlabAccessToken == gitlabAccessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, configPath, kubectlConfig, gitlabAccessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KoalityConfigCopyWith<_$_KoalityConfig> get copyWith =>
      __$$_KoalityConfigCopyWithImpl<_$_KoalityConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KoalityConfigToJson(
      this,
    );
  }
}

abstract class _KoalityConfig extends KoalityConfig {
  const factory _KoalityConfig(
      {required final String configPath,
      final KubectlConfig kubectlConfig,
      final String? gitlabAccessToken}) = _$_KoalityConfig;
  const _KoalityConfig._() : super._();

  factory _KoalityConfig.fromJson(Map<String, dynamic> json) =
      _$_KoalityConfig.fromJson;

  @override
  String get configPath;
  @override
  KubectlConfig get kubectlConfig;
  @override
  String? get gitlabAccessToken;
  @override
  @JsonKey(ignore: true)
  _$$_KoalityConfigCopyWith<_$_KoalityConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

KubectlConfig _$KubectlConfigFromJson(Map<String, dynamic> json) {
  return _KubectlConfig.fromJson(json);
}

/// @nodoc
mixin _$KubectlConfig {
  String get defaultNamespace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KubectlConfigCopyWith<KubectlConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KubectlConfigCopyWith<$Res> {
  factory $KubectlConfigCopyWith(
          KubectlConfig value, $Res Function(KubectlConfig) then) =
      _$KubectlConfigCopyWithImpl<$Res, KubectlConfig>;
  @useResult
  $Res call({String defaultNamespace});
}

/// @nodoc
class _$KubectlConfigCopyWithImpl<$Res, $Val extends KubectlConfig>
    implements $KubectlConfigCopyWith<$Res> {
  _$KubectlConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultNamespace = null,
  }) {
    return _then(_value.copyWith(
      defaultNamespace: null == defaultNamespace
          ? _value.defaultNamespace
          : defaultNamespace // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KubectlConfigCopyWith<$Res>
    implements $KubectlConfigCopyWith<$Res> {
  factory _$$_KubectlConfigCopyWith(
          _$_KubectlConfig value, $Res Function(_$_KubectlConfig) then) =
      __$$_KubectlConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String defaultNamespace});
}

/// @nodoc
class __$$_KubectlConfigCopyWithImpl<$Res>
    extends _$KubectlConfigCopyWithImpl<$Res, _$_KubectlConfig>
    implements _$$_KubectlConfigCopyWith<$Res> {
  __$$_KubectlConfigCopyWithImpl(
      _$_KubectlConfig _value, $Res Function(_$_KubectlConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultNamespace = null,
  }) {
    return _then(_$_KubectlConfig(
      defaultNamespace: null == defaultNamespace
          ? _value.defaultNamespace
          : defaultNamespace // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KubectlConfig extends _KubectlConfig {
  const _$_KubectlConfig({this.defaultNamespace = 'gitlab-managed-apps'})
      : super._();

  factory _$_KubectlConfig.fromJson(Map<String, dynamic> json) =>
      _$$_KubectlConfigFromJson(json);

  @override
  @JsonKey()
  final String defaultNamespace;

  @override
  String toString() {
    return 'KubectlConfig(defaultNamespace: $defaultNamespace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KubectlConfig &&
            (identical(other.defaultNamespace, defaultNamespace) ||
                other.defaultNamespace == defaultNamespace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, defaultNamespace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KubectlConfigCopyWith<_$_KubectlConfig> get copyWith =>
      __$$_KubectlConfigCopyWithImpl<_$_KubectlConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KubectlConfigToJson(
      this,
    );
  }
}

abstract class _KubectlConfig extends KubectlConfig {
  const factory _KubectlConfig({final String defaultNamespace}) =
      _$_KubectlConfig;
  const _KubectlConfig._() : super._();

  factory _KubectlConfig.fromJson(Map<String, dynamic> json) =
      _$_KubectlConfig.fromJson;

  @override
  String get defaultNamespace;
  @override
  @JsonKey(ignore: true)
  _$$_KubectlConfigCopyWith<_$_KubectlConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

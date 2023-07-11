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
  FirebaseConfig get firebaseConfig => throw _privateConstructorUsedError;
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
      FirebaseConfig firebaseConfig,
      String? gitlabAccessToken});

  $KubectlConfigCopyWith<$Res> get kubectlConfig;
  $FirebaseConfigCopyWith<$Res> get firebaseConfig;
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
    Object? firebaseConfig = null,
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
      firebaseConfig: null == firebaseConfig
          ? _value.firebaseConfig
          : firebaseConfig // ignore: cast_nullable_to_non_nullable
              as FirebaseConfig,
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

  @override
  @pragma('vm:prefer-inline')
  $FirebaseConfigCopyWith<$Res> get firebaseConfig {
    return $FirebaseConfigCopyWith<$Res>(_value.firebaseConfig, (value) {
      return _then(_value.copyWith(firebaseConfig: value) as $Val);
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
      FirebaseConfig firebaseConfig,
      String? gitlabAccessToken});

  @override
  $KubectlConfigCopyWith<$Res> get kubectlConfig;
  @override
  $FirebaseConfigCopyWith<$Res> get firebaseConfig;
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
    Object? firebaseConfig = null,
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
      firebaseConfig: null == firebaseConfig
          ? _value.firebaseConfig
          : firebaseConfig // ignore: cast_nullable_to_non_nullable
              as FirebaseConfig,
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
      this.firebaseConfig = const FirebaseConfig(),
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
  @JsonKey()
  final FirebaseConfig firebaseConfig;
  @override
  final String? gitlabAccessToken;

  @override
  String toString() {
    return 'KoalityConfig(configPath: $configPath, kubectlConfig: $kubectlConfig, firebaseConfig: $firebaseConfig, gitlabAccessToken: $gitlabAccessToken)';
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
            (identical(other.firebaseConfig, firebaseConfig) ||
                other.firebaseConfig == firebaseConfig) &&
            (identical(other.gitlabAccessToken, gitlabAccessToken) ||
                other.gitlabAccessToken == gitlabAccessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, configPath, kubectlConfig,
      firebaseConfig, gitlabAccessToken);

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
      final FirebaseConfig firebaseConfig,
      final String? gitlabAccessToken}) = _$_KoalityConfig;
  const _KoalityConfig._() : super._();

  factory _KoalityConfig.fromJson(Map<String, dynamic> json) =
      _$_KoalityConfig.fromJson;

  @override
  String get configPath;
  @override
  KubectlConfig get kubectlConfig;
  @override
  FirebaseConfig get firebaseConfig;
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

FirebaseConfig _$FirebaseConfigFromJson(Map<String, dynamic> json) {
  return _FirebaseConfig.fromJson(json);
}

/// @nodoc
mixin _$FirebaseConfig {
  bool get skipDev => throw _privateConstructorUsedError;
  bool get skipProd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseConfigCopyWith<FirebaseConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseConfigCopyWith<$Res> {
  factory $FirebaseConfigCopyWith(
          FirebaseConfig value, $Res Function(FirebaseConfig) then) =
      _$FirebaseConfigCopyWithImpl<$Res, FirebaseConfig>;
  @useResult
  $Res call({bool skipDev, bool skipProd});
}

/// @nodoc
class _$FirebaseConfigCopyWithImpl<$Res, $Val extends FirebaseConfig>
    implements $FirebaseConfigCopyWith<$Res> {
  _$FirebaseConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skipDev = null,
    Object? skipProd = null,
  }) {
    return _then(_value.copyWith(
      skipDev: null == skipDev
          ? _value.skipDev
          : skipDev // ignore: cast_nullable_to_non_nullable
              as bool,
      skipProd: null == skipProd
          ? _value.skipProd
          : skipProd // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FirebaseConfigCopyWith<$Res>
    implements $FirebaseConfigCopyWith<$Res> {
  factory _$$_FirebaseConfigCopyWith(
          _$_FirebaseConfig value, $Res Function(_$_FirebaseConfig) then) =
      __$$_FirebaseConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool skipDev, bool skipProd});
}

/// @nodoc
class __$$_FirebaseConfigCopyWithImpl<$Res>
    extends _$FirebaseConfigCopyWithImpl<$Res, _$_FirebaseConfig>
    implements _$$_FirebaseConfigCopyWith<$Res> {
  __$$_FirebaseConfigCopyWithImpl(
      _$_FirebaseConfig _value, $Res Function(_$_FirebaseConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skipDev = null,
    Object? skipProd = null,
  }) {
    return _then(_$_FirebaseConfig(
      skipDev: null == skipDev
          ? _value.skipDev
          : skipDev // ignore: cast_nullable_to_non_nullable
              as bool,
      skipProd: null == skipProd
          ? _value.skipProd
          : skipProd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirebaseConfig extends _FirebaseConfig {
  const _$_FirebaseConfig({this.skipDev = false, this.skipProd = false})
      : super._();

  factory _$_FirebaseConfig.fromJson(Map<String, dynamic> json) =>
      _$$_FirebaseConfigFromJson(json);

  @override
  @JsonKey()
  final bool skipDev;
  @override
  @JsonKey()
  final bool skipProd;

  @override
  String toString() {
    return 'FirebaseConfig(skipDev: $skipDev, skipProd: $skipProd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirebaseConfig &&
            (identical(other.skipDev, skipDev) || other.skipDev == skipDev) &&
            (identical(other.skipProd, skipProd) ||
                other.skipProd == skipProd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, skipDev, skipProd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FirebaseConfigCopyWith<_$_FirebaseConfig> get copyWith =>
      __$$_FirebaseConfigCopyWithImpl<_$_FirebaseConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirebaseConfigToJson(
      this,
    );
  }
}

abstract class _FirebaseConfig extends FirebaseConfig {
  const factory _FirebaseConfig({final bool skipDev, final bool skipProd}) =
      _$_FirebaseConfig;
  const _FirebaseConfig._() : super._();

  factory _FirebaseConfig.fromJson(Map<String, dynamic> json) =
      _$_FirebaseConfig.fromJson;

  @override
  bool get skipDev;
  @override
  bool get skipProd;
  @override
  @JsonKey(ignore: true)
  _$$_FirebaseConfigCopyWith<_$_FirebaseConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  $KoalityConfigCopyWith<KoalityConfig> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KoalityConfigCopyWith<$Res> {
  factory $KoalityConfigCopyWith(KoalityConfig value, $Res Function(KoalityConfig) then) =
      _$KoalityConfigCopyWithImpl<$Res, KoalityConfig>;
  @useResult
  $Res call({String configPath, KubectlConfig kubectlConfig, FirebaseConfig firebaseConfig, String? gitlabAccessToken});

  $KubectlConfigCopyWith<$Res> get kubectlConfig;
  $FirebaseConfigCopyWith<$Res> get firebaseConfig;
}

/// @nodoc
class _$KoalityConfigCopyWithImpl<$Res, $Val extends KoalityConfig> implements $KoalityConfigCopyWith<$Res> {
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
abstract class _$$KoalityConfigImplCopyWith<$Res> implements $KoalityConfigCopyWith<$Res> {
  factory _$$KoalityConfigImplCopyWith(_$KoalityConfigImpl value, $Res Function(_$KoalityConfigImpl) then) =
      __$$KoalityConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String configPath, KubectlConfig kubectlConfig, FirebaseConfig firebaseConfig, String? gitlabAccessToken});

  @override
  $KubectlConfigCopyWith<$Res> get kubectlConfig;
  @override
  $FirebaseConfigCopyWith<$Res> get firebaseConfig;
}

/// @nodoc
class __$$KoalityConfigImplCopyWithImpl<$Res> extends _$KoalityConfigCopyWithImpl<$Res, _$KoalityConfigImpl>
    implements _$$KoalityConfigImplCopyWith<$Res> {
  __$$KoalityConfigImplCopyWithImpl(_$KoalityConfigImpl _value, $Res Function(_$KoalityConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? configPath = null,
    Object? kubectlConfig = null,
    Object? firebaseConfig = null,
    Object? gitlabAccessToken = freezed,
  }) {
    return _then(_$KoalityConfigImpl(
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
class _$KoalityConfigImpl extends _KoalityConfig {
  const _$KoalityConfigImpl(
      {required this.configPath,
      this.kubectlConfig = const KubectlConfig(),
      this.firebaseConfig = const FirebaseConfig(),
      this.gitlabAccessToken})
      : super._();

  factory _$KoalityConfigImpl.fromJson(Map<String, dynamic> json) => _$$KoalityConfigImplFromJson(json);

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
            other is _$KoalityConfigImpl &&
            (identical(other.configPath, configPath) || other.configPath == configPath) &&
            (identical(other.kubectlConfig, kubectlConfig) || other.kubectlConfig == kubectlConfig) &&
            (identical(other.firebaseConfig, firebaseConfig) || other.firebaseConfig == firebaseConfig) &&
            (identical(other.gitlabAccessToken, gitlabAccessToken) || other.gitlabAccessToken == gitlabAccessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, configPath, kubectlConfig, firebaseConfig, gitlabAccessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KoalityConfigImplCopyWith<_$KoalityConfigImpl> get copyWith =>
      __$$KoalityConfigImplCopyWithImpl<_$KoalityConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KoalityConfigImplToJson(
      this,
    );
  }
}

abstract class _KoalityConfig extends KoalityConfig {
  const factory _KoalityConfig(
      {required final String configPath,
      final KubectlConfig kubectlConfig,
      final FirebaseConfig firebaseConfig,
      final String? gitlabAccessToken}) = _$KoalityConfigImpl;
  const _KoalityConfig._() : super._();

  factory _KoalityConfig.fromJson(Map<String, dynamic> json) = _$KoalityConfigImpl.fromJson;

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
  _$$KoalityConfigImplCopyWith<_$KoalityConfigImpl> get copyWith => throw _privateConstructorUsedError;
}

KubectlConfig _$KubectlConfigFromJson(Map<String, dynamic> json) {
  return _KubectlConfig.fromJson(json);
}

/// @nodoc
mixin _$KubectlConfig {
  String get defaultNamespace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KubectlConfigCopyWith<KubectlConfig> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KubectlConfigCopyWith<$Res> {
  factory $KubectlConfigCopyWith(KubectlConfig value, $Res Function(KubectlConfig) then) =
      _$KubectlConfigCopyWithImpl<$Res, KubectlConfig>;
  @useResult
  $Res call({String defaultNamespace});
}

/// @nodoc
class _$KubectlConfigCopyWithImpl<$Res, $Val extends KubectlConfig> implements $KubectlConfigCopyWith<$Res> {
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
abstract class _$$KubectlConfigImplCopyWith<$Res> implements $KubectlConfigCopyWith<$Res> {
  factory _$$KubectlConfigImplCopyWith(_$KubectlConfigImpl value, $Res Function(_$KubectlConfigImpl) then) =
      __$$KubectlConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String defaultNamespace});
}

/// @nodoc
class __$$KubectlConfigImplCopyWithImpl<$Res> extends _$KubectlConfigCopyWithImpl<$Res, _$KubectlConfigImpl>
    implements _$$KubectlConfigImplCopyWith<$Res> {
  __$$KubectlConfigImplCopyWithImpl(_$KubectlConfigImpl _value, $Res Function(_$KubectlConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultNamespace = null,
  }) {
    return _then(_$KubectlConfigImpl(
      defaultNamespace: null == defaultNamespace
          ? _value.defaultNamespace
          : defaultNamespace // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KubectlConfigImpl extends _KubectlConfig {
  const _$KubectlConfigImpl({this.defaultNamespace = 'gitlab-managed-apps'}) : super._();

  factory _$KubectlConfigImpl.fromJson(Map<String, dynamic> json) => _$$KubectlConfigImplFromJson(json);

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
            other is _$KubectlConfigImpl &&
            (identical(other.defaultNamespace, defaultNamespace) || other.defaultNamespace == defaultNamespace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, defaultNamespace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KubectlConfigImplCopyWith<_$KubectlConfigImpl> get copyWith =>
      __$$KubectlConfigImplCopyWithImpl<_$KubectlConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KubectlConfigImplToJson(
      this,
    );
  }
}

abstract class _KubectlConfig extends KubectlConfig {
  const factory _KubectlConfig({final String defaultNamespace}) = _$KubectlConfigImpl;
  const _KubectlConfig._() : super._();

  factory _KubectlConfig.fromJson(Map<String, dynamic> json) = _$KubectlConfigImpl.fromJson;

  @override
  String get defaultNamespace;
  @override
  @JsonKey(ignore: true)
  _$$KubectlConfigImplCopyWith<_$KubectlConfigImpl> get copyWith => throw _privateConstructorUsedError;
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
  $FirebaseConfigCopyWith<FirebaseConfig> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseConfigCopyWith<$Res> {
  factory $FirebaseConfigCopyWith(FirebaseConfig value, $Res Function(FirebaseConfig) then) =
      _$FirebaseConfigCopyWithImpl<$Res, FirebaseConfig>;
  @useResult
  $Res call({bool skipDev, bool skipProd});
}

/// @nodoc
class _$FirebaseConfigCopyWithImpl<$Res, $Val extends FirebaseConfig> implements $FirebaseConfigCopyWith<$Res> {
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
abstract class _$$FirebaseConfigImplCopyWith<$Res> implements $FirebaseConfigCopyWith<$Res> {
  factory _$$FirebaseConfigImplCopyWith(_$FirebaseConfigImpl value, $Res Function(_$FirebaseConfigImpl) then) =
      __$$FirebaseConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool skipDev, bool skipProd});
}

/// @nodoc
class __$$FirebaseConfigImplCopyWithImpl<$Res> extends _$FirebaseConfigCopyWithImpl<$Res, _$FirebaseConfigImpl>
    implements _$$FirebaseConfigImplCopyWith<$Res> {
  __$$FirebaseConfigImplCopyWithImpl(_$FirebaseConfigImpl _value, $Res Function(_$FirebaseConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skipDev = null,
    Object? skipProd = null,
  }) {
    return _then(_$FirebaseConfigImpl(
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
class _$FirebaseConfigImpl extends _FirebaseConfig {
  const _$FirebaseConfigImpl({this.skipDev = false, this.skipProd = false}) : super._();

  factory _$FirebaseConfigImpl.fromJson(Map<String, dynamic> json) => _$$FirebaseConfigImplFromJson(json);

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
            other is _$FirebaseConfigImpl &&
            (identical(other.skipDev, skipDev) || other.skipDev == skipDev) &&
            (identical(other.skipProd, skipProd) || other.skipProd == skipProd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, skipDev, skipProd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseConfigImplCopyWith<_$FirebaseConfigImpl> get copyWith =>
      __$$FirebaseConfigImplCopyWithImpl<_$FirebaseConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseConfigImplToJson(
      this,
    );
  }
}

abstract class _FirebaseConfig extends FirebaseConfig {
  const factory _FirebaseConfig({final bool skipDev, final bool skipProd}) = _$FirebaseConfigImpl;
  const _FirebaseConfig._() : super._();

  factory _FirebaseConfig.fromJson(Map<String, dynamic> json) = _$FirebaseConfigImpl.fromJson;

  @override
  bool get skipDev;
  @override
  bool get skipProd;
  @override
  @JsonKey(ignore: true)
  _$$FirebaseConfigImplCopyWith<_$FirebaseConfigImpl> get copyWith => throw _privateConstructorUsedError;
}

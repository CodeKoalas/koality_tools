// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KoalityConfig _$$_KoalityConfigFromJson(Map<String, dynamic> json) => _$_KoalityConfig(
      configPath: json['configPath'] as String,
      kubectlConfig: json['kubectlConfig'] == null
          ? const KubectlConfig()
          : KubectlConfig.fromJson(json['kubectlConfig'] as Map<String, dynamic>),
      firebaseConfig: json['firebaseConfig'] == null
          ? const FirebaseConfig()
          : FirebaseConfig.fromJson(json['firebaseConfig'] as Map<String, dynamic>),
      gitlabAccessToken: json['gitlabAccessToken'] as String?,
    );

Map<String, dynamic> _$$_KoalityConfigToJson(_$_KoalityConfig instance) => <String, dynamic>{
      'configPath': instance.configPath,
      'kubectlConfig': instance.kubectlConfig,
      'firebaseConfig': instance.firebaseConfig,
      'gitlabAccessToken': instance.gitlabAccessToken,
    };

_$_KubectlConfig _$$_KubectlConfigFromJson(Map<String, dynamic> json) => _$_KubectlConfig(
      defaultNamespace: json['defaultNamespace'] as String? ?? 'gitlab-managed-apps',
    );

Map<String, dynamic> _$$_KubectlConfigToJson(_$_KubectlConfig instance) => <String, dynamic>{
      'defaultNamespace': instance.defaultNamespace,
    };

_$_FirebaseConfig _$$_FirebaseConfigFromJson(Map<String, dynamic> json) => _$_FirebaseConfig(
      skipDev: json['skipDev'] as bool? ?? false,
      skipProd: json['skipProd'] as bool? ?? false,
    );

Map<String, dynamic> _$$_FirebaseConfigToJson(_$_FirebaseConfig instance) => <String, dynamic>{
      'skipDev': instance.skipDev,
      'skipProd': instance.skipProd,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getKoalityConfigHash() => r'0b6cfbf0ac2b85a8c65055af57fd061f2b9bf4de';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getKoalityConfig].
@ProviderFor(getKoalityConfig)
const getKoalityConfigProvider = GetKoalityConfigFamily();

/// See also [getKoalityConfig].
class GetKoalityConfigFamily extends Family<AsyncValue<KoalityConfig>> {
  /// See also [getKoalityConfig].
  const GetKoalityConfigFamily();

  /// See also [getKoalityConfig].
  GetKoalityConfigProvider call({
    required Logger logger,
    String? overrideConfigPath,
  }) {
    return GetKoalityConfigProvider(
      logger: logger,
      overrideConfigPath: overrideConfigPath,
    );
  }

  @override
  GetKoalityConfigProvider getProviderOverride(
    covariant GetKoalityConfigProvider provider,
  ) {
    return call(
      logger: provider.logger,
      overrideConfigPath: provider.overrideConfigPath,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'getKoalityConfigProvider';
}

/// See also [getKoalityConfig].
class GetKoalityConfigProvider extends AutoDisposeFutureProvider<KoalityConfig> {
  /// See also [getKoalityConfig].
  GetKoalityConfigProvider({
    required Logger logger,
    String? overrideConfigPath,
  }) : this._internal(
          (ref) => getKoalityConfig(
            ref as GetKoalityConfigRef,
            logger: logger,
            overrideConfigPath: overrideConfigPath,
          ),
          from: getKoalityConfigProvider,
          name: r'getKoalityConfigProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getKoalityConfigHash,
          dependencies: GetKoalityConfigFamily._dependencies,
          allTransitiveDependencies: GetKoalityConfigFamily._allTransitiveDependencies,
          logger: logger,
          overrideConfigPath: overrideConfigPath,
        );

  GetKoalityConfigProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.logger,
    required this.overrideConfigPath,
  }) : super.internal();

  final Logger logger;
  final String? overrideConfigPath;

  @override
  Override overrideWith(
    FutureOr<KoalityConfig> Function(GetKoalityConfigRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetKoalityConfigProvider._internal(
        (ref) => create(ref as GetKoalityConfigRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        logger: logger,
        overrideConfigPath: overrideConfigPath,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<KoalityConfig> createElement() {
    return _GetKoalityConfigProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetKoalityConfigProvider &&
        other.logger == logger &&
        other.overrideConfigPath == overrideConfigPath;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, logger.hashCode);
    hash = _SystemHash.combine(hash, overrideConfigPath.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetKoalityConfigRef on AutoDisposeFutureProviderRef<KoalityConfig> {
  /// The parameter `logger` of this provider.
  Logger get logger;

  /// The parameter `overrideConfigPath` of this provider.
  String? get overrideConfigPath;
}

class _GetKoalityConfigProviderElement extends AutoDisposeFutureProviderElement<KoalityConfig>
    with GetKoalityConfigRef {
  _GetKoalityConfigProviderElement(super.provider);

  @override
  Logger get logger => (origin as GetKoalityConfigProvider).logger;
  @override
  String? get overrideConfigPath => (origin as GetKoalityConfigProvider).overrideConfigPath;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

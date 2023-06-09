// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KoalityConfig _$$_KoalityConfigFromJson(Map<String, dynamic> json) =>
    _$_KoalityConfig(
      configPath: json['configPath'] as String,
      kubectlConfig: json['kubectlConfig'] == null
          ? const KubectlConfig()
          : KubectlConfig.fromJson(
              json['kubectlConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_KoalityConfigToJson(_$_KoalityConfig instance) =>
    <String, dynamic>{
      'configPath': instance.configPath,
      'kubectlConfig': instance.kubectlConfig,
    };

_$_KubectlConfig _$$_KubectlConfigFromJson(Map<String, dynamic> json) =>
    _$_KubectlConfig(
      defaultNamespace:
          json['defaultNamespace'] as String? ?? 'gitlab-managed-apps',
    );

Map<String, dynamic> _$$_KubectlConfigToJson(_$_KubectlConfig instance) =>
    <String, dynamic>{
      'defaultNamespace': instance.defaultNamespace,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getKoalityConfigHash() => r'e7a91b3bc3558a14e2551b9c2f03109aff957358';

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

typedef GetKoalityConfigRef = AutoDisposeFutureProviderRef<KoalityConfig>;

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
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getKoalityConfigProvider';
}

/// See also [getKoalityConfig].
class GetKoalityConfigProvider
    extends AutoDisposeFutureProvider<KoalityConfig> {
  /// See also [getKoalityConfig].
  GetKoalityConfigProvider({
    required this.logger,
    this.overrideConfigPath,
  }) : super.internal(
          (ref) => getKoalityConfig(
            ref,
            logger: logger,
            overrideConfigPath: overrideConfigPath,
          ),
          from: getKoalityConfigProvider,
          name: r'getKoalityConfigProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getKoalityConfigHash,
          dependencies: GetKoalityConfigFamily._dependencies,
          allTransitiveDependencies:
              GetKoalityConfigFamily._allTransitiveDependencies,
        );

  final Logger logger;
  final String? overrideConfigPath;

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getConfigManagerHash() => r'a99fee8aa0247337002965ea7ec90e5e7a72dc61';

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

typedef GetConfigManagerRef = AutoDisposeProviderRef<KoalityConfigManager>;

/// See also [getConfigManager].
@ProviderFor(getConfigManager)
const getConfigManagerProvider = GetConfigManagerFamily();

/// See also [getConfigManager].
class GetConfigManagerFamily extends Family<KoalityConfigManager> {
  /// See also [getConfigManager].
  const GetConfigManagerFamily();

  /// See also [getConfigManager].
  GetConfigManagerProvider call({
    required Logger logger,
  }) {
    return GetConfigManagerProvider(
      logger: logger,
    );
  }

  @override
  GetConfigManagerProvider getProviderOverride(
    covariant GetConfigManagerProvider provider,
  ) {
    return call(
      logger: provider.logger,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'getConfigManagerProvider';
}

/// See also [getConfigManager].
class GetConfigManagerProvider extends AutoDisposeProvider<KoalityConfigManager> {
  /// See also [getConfigManager].
  GetConfigManagerProvider({
    required this.logger,
  }) : super.internal(
          (ref) => getConfigManager(
            ref,
            logger: logger,
          ),
          from: getConfigManagerProvider,
          name: r'getConfigManagerProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getConfigManagerHash,
          dependencies: GetConfigManagerFamily._dependencies,
          allTransitiveDependencies: GetConfigManagerFamily._allTransitiveDependencies,
        );

  final Logger logger;

  @override
  bool operator ==(Object other) {
    return other is GetConfigManagerProvider && other.logger == logger;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, logger.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

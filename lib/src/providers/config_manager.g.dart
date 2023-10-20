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
    required Logger logger,
  }) : this._internal(
          (ref) => getConfigManager(
            ref as GetConfigManagerRef,
            logger: logger,
          ),
          from: getConfigManagerProvider,
          name: r'getConfigManagerProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getConfigManagerHash,
          dependencies: GetConfigManagerFamily._dependencies,
          allTransitiveDependencies: GetConfigManagerFamily._allTransitiveDependencies,
          logger: logger,
        );

  GetConfigManagerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.logger,
  }) : super.internal();

  final Logger logger;

  @override
  Override overrideWith(
    KoalityConfigManager Function(GetConfigManagerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetConfigManagerProvider._internal(
        (ref) => create(ref as GetConfigManagerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        logger: logger,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<KoalityConfigManager> createElement() {
    return _GetConfigManagerProviderElement(this);
  }

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

mixin GetConfigManagerRef on AutoDisposeProviderRef<KoalityConfigManager> {
  /// The parameter `logger` of this provider.
  Logger get logger;
}

class _GetConfigManagerProviderElement extends AutoDisposeProviderElement<KoalityConfigManager>
    with GetConfigManagerRef {
  _GetConfigManagerProviderElement(super.provider);

  @override
  Logger get logger => (origin as GetConfigManagerProvider).logger;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

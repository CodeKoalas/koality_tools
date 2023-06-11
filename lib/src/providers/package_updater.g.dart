// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_updater.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPackageUpdaterHash() => r'b508578918dad1af8d8ded667d014e665bc91c1c';

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

typedef GetPackageUpdaterRef = AutoDisposeFutureProviderRef<PackageUpdater>;

/// See also [getPackageUpdater].
@ProviderFor(getPackageUpdater)
const getPackageUpdaterProvider = GetPackageUpdaterFamily();

/// See also [getPackageUpdater].
class GetPackageUpdaterFamily extends Family<AsyncValue<PackageUpdater>> {
  /// See also [getPackageUpdater].
  const GetPackageUpdaterFamily();

  /// See also [getPackageUpdater].
  GetPackageUpdaterProvider call({
    required Logger logger,
  }) {
    return GetPackageUpdaterProvider(
      logger: logger,
    );
  }

  @override
  GetPackageUpdaterProvider getProviderOverride(
    covariant GetPackageUpdaterProvider provider,
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
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getPackageUpdaterProvider';
}

/// See also [getPackageUpdater].
class GetPackageUpdaterProvider
    extends AutoDisposeFutureProvider<PackageUpdater> {
  /// See also [getPackageUpdater].
  GetPackageUpdaterProvider({
    required this.logger,
  }) : super.internal(
          (ref) => getPackageUpdater(
            ref,
            logger: logger,
          ),
          from: getPackageUpdaterProvider,
          name: r'getPackageUpdaterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPackageUpdaterHash,
          dependencies: GetPackageUpdaterFamily._dependencies,
          allTransitiveDependencies:
              GetPackageUpdaterFamily._allTransitiveDependencies,
        );

  final Logger logger;

  @override
  bool operator ==(Object other) {
    return other is GetPackageUpdaterProvider && other.logger == logger;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, logger.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

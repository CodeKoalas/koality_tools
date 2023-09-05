// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_pubpsec.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPackagePubspecHash() => r'234552534f3ae75507b38efae34064174fcc3e52';

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

/// See also [getPackagePubspec].
@ProviderFor(getPackagePubspec)
const getPackagePubspecProvider = GetPackagePubspecFamily();

/// See also [getPackagePubspec].
class GetPackagePubspecFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [getPackagePubspec].
  const GetPackagePubspecFamily();

  /// See also [getPackagePubspec].
  GetPackagePubspecProvider call({
    required String path,
  }) {
    return GetPackagePubspecProvider(
      path: path,
    );
  }

  @override
  GetPackagePubspecProvider getProviderOverride(
    covariant GetPackagePubspecProvider provider,
  ) {
    return call(
      path: provider.path,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'getPackagePubspecProvider';
}

/// See also [getPackagePubspec].
class GetPackagePubspecProvider extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [getPackagePubspec].
  GetPackagePubspecProvider({
    required String path,
  }) : this._internal(
          (ref) => getPackagePubspec(
            ref as GetPackagePubspecRef,
            path: path,
          ),
          from: getPackagePubspecProvider,
          name: r'getPackagePubspecProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getPackagePubspecHash,
          dependencies: GetPackagePubspecFamily._dependencies,
          allTransitiveDependencies: GetPackagePubspecFamily._allTransitiveDependencies,
          path: path,
        );

  GetPackagePubspecProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(GetPackagePubspecRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPackagePubspecProvider._internal(
        (ref) => create(ref as GetPackagePubspecRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _GetPackagePubspecProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPackagePubspecProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPackagePubspecRef on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `path` of this provider.
  String get path;
}

class _GetPackagePubspecProviderElement extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with GetPackagePubspecRef {
  _GetPackagePubspecProviderElement(super.provider);

  @override
  String get path => (origin as GetPackagePubspecProvider).path;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

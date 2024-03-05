// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitlab_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getGitlabApiHash() => r'53afd6f2accd1fffacd2f4f26ee485db6742e12c';

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

/// See also [getGitlabApi].
@ProviderFor(getGitlabApi)
const getGitlabApiProvider = GetGitlabApiFamily();

/// See also [getGitlabApi].
class GetGitlabApiFamily extends Family<AsyncValue<GitlabApi>> {
  /// See also [getGitlabApi].
  const GetGitlabApiFamily();

  /// See also [getGitlabApi].
  GetGitlabApiProvider call({
    required Logger logger,
    String? accessToken,
  }) {
    return GetGitlabApiProvider(
      logger: logger,
      accessToken: accessToken,
    );
  }

  @override
  GetGitlabApiProvider getProviderOverride(
    covariant GetGitlabApiProvider provider,
  ) {
    return call(
      logger: provider.logger,
      accessToken: provider.accessToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'getGitlabApiProvider';
}

/// See also [getGitlabApi].
class GetGitlabApiProvider extends AutoDisposeFutureProvider<GitlabApi> {
  /// See also [getGitlabApi].
  GetGitlabApiProvider({
    required Logger logger,
    String? accessToken,
  }) : this._internal(
          (ref) => getGitlabApi(
            ref as GetGitlabApiRef,
            logger: logger,
            accessToken: accessToken,
          ),
          from: getGitlabApiProvider,
          name: r'getGitlabApiProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$getGitlabApiHash,
          dependencies: GetGitlabApiFamily._dependencies,
          allTransitiveDependencies: GetGitlabApiFamily._allTransitiveDependencies,
          logger: logger,
          accessToken: accessToken,
        );

  GetGitlabApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.logger,
    required this.accessToken,
  }) : super.internal();

  final Logger logger;
  final String? accessToken;

  @override
  Override overrideWith(
    FutureOr<GitlabApi> Function(GetGitlabApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetGitlabApiProvider._internal(
        (ref) => create(ref as GetGitlabApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        logger: logger,
        accessToken: accessToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GitlabApi> createElement() {
    return _GetGitlabApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGitlabApiProvider && other.logger == logger && other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, logger.hashCode);
    hash = _SystemHash.combine(hash, accessToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetGitlabApiRef on AutoDisposeFutureProviderRef<GitlabApi> {
  /// The parameter `logger` of this provider.
  Logger get logger;

  /// The parameter `accessToken` of this provider.
  String? get accessToken;
}

class _GetGitlabApiProviderElement extends AutoDisposeFutureProviderElement<GitlabApi> with GetGitlabApiRef {
  _GetGitlabApiProviderElement(super.provider);

  @override
  Logger get logger => (origin as GetGitlabApiProvider).logger;
  @override
  String? get accessToken => (origin as GetGitlabApiProvider).accessToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

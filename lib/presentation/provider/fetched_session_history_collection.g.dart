// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetched_session_history_collection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchedSessionHistoryCollectionHash() =>
    r'eeac0f05cb259c53a5d9b01599e6a575bd8aeb89';

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

abstract class _$FetchedSessionHistoryCollection
    extends BuildlessAutoDisposeAsyncNotifier<List<SessionHistory>> {
  late final String programHistoryUid;

  FutureOr<List<SessionHistory>> build(
    String programHistoryUid,
  );
}

/// See also [FetchedSessionHistoryCollection].
@ProviderFor(FetchedSessionHistoryCollection)
const fetchedSessionHistoryCollectionProvider =
    FetchedSessionHistoryCollectionFamily();

/// See also [FetchedSessionHistoryCollection].
class FetchedSessionHistoryCollectionFamily
    extends Family<AsyncValue<List<SessionHistory>>> {
  /// See also [FetchedSessionHistoryCollection].
  const FetchedSessionHistoryCollectionFamily();

  /// See also [FetchedSessionHistoryCollection].
  FetchedSessionHistoryCollectionProvider call(
    String programHistoryUid,
  ) {
    return FetchedSessionHistoryCollectionProvider(
      programHistoryUid,
    );
  }

  @override
  FetchedSessionHistoryCollectionProvider getProviderOverride(
    covariant FetchedSessionHistoryCollectionProvider provider,
  ) {
    return call(
      provider.programHistoryUid,
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
  String? get name => r'fetchedSessionHistoryCollectionProvider';
}

/// See also [FetchedSessionHistoryCollection].
class FetchedSessionHistoryCollectionProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchedSessionHistoryCollection, List<SessionHistory>> {
  /// See also [FetchedSessionHistoryCollection].
  FetchedSessionHistoryCollectionProvider(
    String programHistoryUid,
  ) : this._internal(
          () => FetchedSessionHistoryCollection()
            ..programHistoryUid = programHistoryUid,
          from: fetchedSessionHistoryCollectionProvider,
          name: r'fetchedSessionHistoryCollectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchedSessionHistoryCollectionHash,
          dependencies: FetchedSessionHistoryCollectionFamily._dependencies,
          allTransitiveDependencies:
              FetchedSessionHistoryCollectionFamily._allTransitiveDependencies,
          programHistoryUid: programHistoryUid,
        );

  FetchedSessionHistoryCollectionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.programHistoryUid,
  }) : super.internal();

  final String programHistoryUid;

  @override
  FutureOr<List<SessionHistory>> runNotifierBuild(
    covariant FetchedSessionHistoryCollection notifier,
  ) {
    return notifier.build(
      programHistoryUid,
    );
  }

  @override
  Override overrideWith(FetchedSessionHistoryCollection Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchedSessionHistoryCollectionProvider._internal(
        () => create()..programHistoryUid = programHistoryUid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        programHistoryUid: programHistoryUid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FetchedSessionHistoryCollection,
      List<SessionHistory>> createElement() {
    return _FetchedSessionHistoryCollectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchedSessionHistoryCollectionProvider &&
        other.programHistoryUid == programHistoryUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, programHistoryUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchedSessionHistoryCollectionRef
    on AutoDisposeAsyncNotifierProviderRef<List<SessionHistory>> {
  /// The parameter `programHistoryUid` of this provider.
  String get programHistoryUid;
}

class _FetchedSessionHistoryCollectionProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchedSessionHistoryCollection,
        List<SessionHistory>> with FetchedSessionHistoryCollectionRef {
  _FetchedSessionHistoryCollectionProviderElement(super.provider);

  @override
  String get programHistoryUid =>
      (origin as FetchedSessionHistoryCollectionProvider).programHistoryUid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

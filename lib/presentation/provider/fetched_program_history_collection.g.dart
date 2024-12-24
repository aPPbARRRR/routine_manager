// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetched_program_history_collection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchedProgramHistoryCollectionHash() =>
    r'03c42ba08b787a400c40b21b3898799d667865c6';

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

abstract class _$FetchedProgramHistoryCollection
    extends BuildlessAutoDisposeAsyncNotifier<List<ProgramHistory>> {
  late final String programUid;

  FutureOr<List<ProgramHistory>> build({
    required String programUid,
  });
}

/// See also [FetchedProgramHistoryCollection].
@ProviderFor(FetchedProgramHistoryCollection)
const fetchedProgramHistoryCollectionProvider =
    FetchedProgramHistoryCollectionFamily();

/// See also [FetchedProgramHistoryCollection].
class FetchedProgramHistoryCollectionFamily
    extends Family<AsyncValue<List<ProgramHistory>>> {
  /// See also [FetchedProgramHistoryCollection].
  const FetchedProgramHistoryCollectionFamily();

  /// See also [FetchedProgramHistoryCollection].
  FetchedProgramHistoryCollectionProvider call({
    required String programUid,
  }) {
    return FetchedProgramHistoryCollectionProvider(
      programUid: programUid,
    );
  }

  @override
  FetchedProgramHistoryCollectionProvider getProviderOverride(
    covariant FetchedProgramHistoryCollectionProvider provider,
  ) {
    return call(
      programUid: provider.programUid,
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
  String? get name => r'fetchedProgramHistoryCollectionProvider';
}

/// See also [FetchedProgramHistoryCollection].
class FetchedProgramHistoryCollectionProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        FetchedProgramHistoryCollection, List<ProgramHistory>> {
  /// See also [FetchedProgramHistoryCollection].
  FetchedProgramHistoryCollectionProvider({
    required String programUid,
  }) : this._internal(
          () => FetchedProgramHistoryCollection()..programUid = programUid,
          from: fetchedProgramHistoryCollectionProvider,
          name: r'fetchedProgramHistoryCollectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchedProgramHistoryCollectionHash,
          dependencies: FetchedProgramHistoryCollectionFamily._dependencies,
          allTransitiveDependencies:
              FetchedProgramHistoryCollectionFamily._allTransitiveDependencies,
          programUid: programUid,
        );

  FetchedProgramHistoryCollectionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.programUid,
  }) : super.internal();

  final String programUid;

  @override
  FutureOr<List<ProgramHistory>> runNotifierBuild(
    covariant FetchedProgramHistoryCollection notifier,
  ) {
    return notifier.build(
      programUid: programUid,
    );
  }

  @override
  Override overrideWith(FetchedProgramHistoryCollection Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchedProgramHistoryCollectionProvider._internal(
        () => create()..programUid = programUid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        programUid: programUid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FetchedProgramHistoryCollection,
      List<ProgramHistory>> createElement() {
    return _FetchedProgramHistoryCollectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchedProgramHistoryCollectionProvider &&
        other.programUid == programUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, programUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchedProgramHistoryCollectionRef
    on AutoDisposeAsyncNotifierProviderRef<List<ProgramHistory>> {
  /// The parameter `programUid` of this provider.
  String get programUid;
}

class _FetchedProgramHistoryCollectionProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FetchedProgramHistoryCollection,
        List<ProgramHistory>> with FetchedProgramHistoryCollectionRef {
  _FetchedProgramHistoryCollectionProviderElement(super.provider);

  @override
  String get programUid =>
      (origin as FetchedProgramHistoryCollectionProvider).programUid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

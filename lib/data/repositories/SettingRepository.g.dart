// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SettingRepository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingRepository)
final settingRepositoryProvider = SettingRepositoryProvider._();

final class SettingRepositoryProvider
    extends
        $FunctionalProvider<
          SettingRepository,
          SettingRepository,
          SettingRepository
        >
    with $Provider<SettingRepository> {
  SettingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingRepository create(Ref ref) {
    return settingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingRepository>(value),
    );
  }
}

String _$settingRepositoryHash() => r'a5a7a6aec181bc5738d82ef859fad4928dcc154f';

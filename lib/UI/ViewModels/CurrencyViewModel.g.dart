// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CurrencyViewModel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrencyNotifier)
final currencyProvider = CurrencyNotifierProvider._();

final class CurrencyNotifierProvider
    extends $NotifierProvider<CurrencyNotifier, String> {
  CurrencyNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currencyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currencyNotifierHash();

  @$internal
  @override
  CurrencyNotifier create() => CurrencyNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$currencyNotifierHash() => r'f2c146f4c6a6643d8f20f52d9c446440a27c65ac';

abstract class _$CurrencyNotifier extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

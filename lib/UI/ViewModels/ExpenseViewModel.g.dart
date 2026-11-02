// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExpenseViewModel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpenseList)
final expenseListProvider = ExpenseListProvider._();

final class ExpenseListProvider
    extends $AsyncNotifierProvider<ExpenseList, List<Expense>> {
  ExpenseListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseListHash();

  @$internal
  @override
  ExpenseList create() => ExpenseList();
}

String _$expenseListHash() => r'd8dd52d0843c9667db79abd3676c5056323d060e';

abstract class _$ExpenseList extends $AsyncNotifier<List<Expense>> {
  FutureOr<List<Expense>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Expense>>, List<Expense>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Expense>>, List<Expense>>,
              AsyncValue<List<Expense>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

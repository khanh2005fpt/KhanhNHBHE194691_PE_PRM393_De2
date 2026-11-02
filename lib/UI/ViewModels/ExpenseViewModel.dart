import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/Expense.dart';
import '../../data/repositories/ExpenseRepository.dart';

part 'ExpenseViewModel.g.dart';

@riverpod
class ExpenseList extends _$ExpenseList {
  late ExpenseRepository _repository;

  @override
  FutureOr<List<Expense>> build() async {
    _repository = ref.watch(expenseRepositoryProvider);
    return await _repository.getAllExpenses();
  }

  Future<void> updateItem(Expense expense) async {
    state = const AsyncValue.loading();
    await _repository.updateExpense(expense);
    state = AsyncValue.data(await _repository.getAllExpenses());
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _repository.getAllExpenses());
  }
}

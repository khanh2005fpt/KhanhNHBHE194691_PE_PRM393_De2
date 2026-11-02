import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:he194691_de2/UI/Views/Widget/CurrentDialogWidget.dart';
import '../../ViewModels/CurrencyViewModel.dart';
import '../../ViewModels/ExpenseViewModel.dart';
import '../Widget/ExpenseItemWidget.dart';

class ExpenseListScreen extends ConsumerWidget {
  const ExpenseListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseState = ref.watch(expenseListProvider);
    final currency = ref.watch(currencyProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text('Quản lý chi tiêu', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        elevation: 0.5,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => const CurrencyDialogWidget(),
              );
            },
          ),
        ],
      ),
      body: expenseState.when(
        data: (expenses) => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: expenses.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return ExpenseItemWidget(
              item: expenses[index],
              currency: currency,
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Lỗi: $err')),
      ),
    );
  }
}

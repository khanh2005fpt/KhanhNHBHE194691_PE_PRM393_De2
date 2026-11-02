import 'package:flutter/material.dart';
import 'package:he194691_de2/UI/Views/Screen/EditExpenseScreen.dart';
import 'package:intl/intl.dart';
import '../../../data/models/Expense.dart';

class ExpenseItemWidget extends StatelessWidget {
  final Expense item;
  final String currency;

  const ExpenseItemWidget({
    super.key,
    required this.item,
    required this.currency,
  });

  String _formatAmount(double amount, String currency) {
    if (currency == 'USD') {
      final usdAmount = amount / 25000;
      return '${NumberFormat('#,##0.00').format(usdAmount)} USD';
    }
    return '${NumberFormat('#,##0').format(amount)} VND';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    item.category,
                    style: const TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.date,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                _formatAmount(item.amount, currency),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.edit_outlined, size: 20, color: Colors.black54),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditExpenseScreen(expense: item),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
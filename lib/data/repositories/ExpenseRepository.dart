import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import '../models/Expense.dart';
import 'DataHelper.dart';

part 'ExpenseRepository.g.dart';

@riverpod
ExpenseRepository expenseRepository(Ref ref) => ExpenseRepository();

class ExpenseRepository {
  final Datahelper _dataHelper = Datahelper.instance;

  final List<Expense> _initialExpenses = [
    Expense(
      id: 1,
      title: 'Ăn uống',
      amount: 150000.0,
      category: 'Sinh hoạt',
      date: '28/10/2026',
    ),
    Expense(
      id: 2,
      title: 'Di chuyển',
      amount: 50000.0,
      category: 'Đi lại',
      date: '28/10/2026',
    ),
    Expense(
      id: 3,
      title: 'Mua sách',
      amount: 200000.0,
      category: 'Học tập',
      date: '27/10/2026',
    ),
    Expense(
      id: 4,
      title: 'Mua sắm',
      amount: 1500000.0,
      category: 'Sinh hoạt',
      date: '25/10/2026',
    ),
    Expense(
      id: 5,
      title: 'Khám bệnh',
      amount: 3550000.0,
      category: 'Sức khỏe',
      date: '22/10/2026',
    ),
  ];

  Future<List<Expense>> getAllExpenses() async {
    final db = await _dataHelper.database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM expenses'),
    );

    if (count == null || count == 0) {
      for (final item in _initialExpenses) {
        await db.insert('expenses', item.toMap());
      }
    }

    final result = await db.query('expenses', orderBy: 'id ASC');
    return result.map((json) => Expense.fromMap(json)).toList();
  }

  Future<int> updateExpense(Expense expense) async {
    final db = await _dataHelper.database;
    return await db.update(
      'expenses',
      expense.toMap(),
      where: 'id = ?',
      whereArgs: [expense.id],
    );
  }
}

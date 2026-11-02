import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Datahelper {
  static final Datahelper instance = Datahelper();
  Future<Database>? _database;

  Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS expenses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        amount REAL NOT NULL,
        category TEXT NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }

  Future<Database> get database async {
    _database ??= _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'expenses.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) async {
        await _createTables(db);
      },
      onCreate: (db, version) async {
        await _createTables(db);
      },
    );
  }
}

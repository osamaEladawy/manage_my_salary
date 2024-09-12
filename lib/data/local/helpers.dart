import 'dart:io';

import 'package:expense_management/data/models/my_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  const DbHelper._();
  static const DbHelper _helper = DbHelper._();
  factory DbHelper() => _helper;
  static Database? _database;

  DbHelper get helper => _helper;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await createDataBase();
      return _database;
    }
  }

  Future<Database?> createDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'installments.db');
    _database = await openDatabase(path, version: 1, onCreate: (db, index) {
      db.execute(
          "CREATE TABLE notes ( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,note TEXT NOT NULL,date TEXT NOT NULL , installment NUM NOT NULL)");
    });
    return _database;
  }

  Future<int> createNote(MyModel note) async {
    Database? database = await helper.database;
    return database!.insert('notes', note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List> selectAllNotes() async {
    Database? dataBase = await helper.database;
    return dataBase!.query('notes');
  }

  Future<List<Map>> readAllNotes() async {
    Database? data = await helper.database;
    return data!.query('notes');
  }

  Future<int> deleteNote(int id) async {
    Database? dataBase = await helper.database;
    return dataBase!.delete('notes', where: 'id = ? ', whereArgs: [id]);
  }

  Future<int> updateNote(MyModel note) async {
    Database? dataBase = await helper.database;
    return dataBase!.update('notes', note.toJson(),
        where: 'id = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> close() async {
    final db = await helper.database;
    if (db != null) {
      await db.close();
    }
  }
}

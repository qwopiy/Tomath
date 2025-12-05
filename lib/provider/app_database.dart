import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._init();

  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initializeDB('data.db');
    return _database!;
  }

  Future deleteDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'data.db');
    print('Deleting database at $path');
    await deleteDatabase(path);
  }

  Future _createDB(Database db, int version) async {
    final tableQuery =  await rootBundle.loadString('assets/data/question_table.txt');
    await db.rawQuery(tableQuery);
    final dataQuery =  await rootBundle.loadString('assets/data/question_data.txt');
    await db.rawQuery(dataQuery);
  }

  Future<Database> _initializeDB(String filename) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, filename);
    print('Initializing database at $path');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void insertQuestion(Map<String, dynamic> question) async {
    final db = await instance.database;
    await db.insert('Question', question);
  }

  Future<List<Map>> getQuestions() async {
    final db = await instance.database;
    return await db.query('Question');
  }

  Future<List<Map>> getQuestionsByBab(String bab) async {
    final db = await instance.database;
    return await db.query('Question', where: 'bab = ?', whereArgs: [bab]);
  }

  Future<List<Map>> getQuestionsById(int min, int max) async {
    final db = await instance.database;
    final list = await db.rawQuery('SELECT * FROM Question WHERE id BETWEEN $min AND $max');
    // print(list);
    return list;
  }

  Future<Map> getRandomQuestion() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT * FROM Question ORDER BY RANDOM() LIMIT 1');
    if (result.isNotEmpty) {
      print('Random question fetched: ${result.first}');
      return result.first;
    } else {
      throw Exception('No questions found in the database.');
    }
  }
}
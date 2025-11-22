import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';


class DatabaseService{
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> get database async{
    if(_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async{
    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "tomath_db.db");

    Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
          await db.execute(
              '''
                CREATE TABLE title (
                    title_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name TEXT,
                    is_unlocked INTEGER
                )
              '''
          );
          await db.execute(
              '''
                CREATE TABLE skin (
                    skin_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    path TEXT,
                    is_unlocked INTEGER
                )
              '''
          );
          await db.execute(
              '''
                CREATE TABLE item_skin (
                    item_skin_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    skin_id INTEGER,
                    is_purchased INTEGER,
                    FOREIGN KEY (skin_id) REFERENCES skin(skin_id) ON DELETE CASCADE
                )
              '''
          );
          await db.execute(
              '''
                CREATE TABLE item_title (
                    item_title_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    title_id INTEGER,
                    is_purchased INTEGER,
                    FOREIGN KEY (title_id) REFERENCES title(title_id) ON DELETE CASCADE
                )
              '''
          );
          await db.execute(
              '''
                CREATE TABLE player (
                    player_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    username TEXT NOT NULL,
                    currency INTEGER DEFAULT 0,
                    progress INTEGER DEFAULT 1,
                    title_id INTEGER DEFAULT 0,
                    skin_id  INTEGER DEFAULT 0,
                    FOREIGN KEY (title_id) REFERENCES title(title_id) ON DELETE CASCADE,
                    FOREIGN KEY (skin_id) REFERENCES skin(skin_id) ON DELETE CASCADE
                )
              '''
          );
          await db.insert('title', {'name': 'Traveler', 'is_unlocked': 1});
      },
      onConfigure: (db) async {
        await db.execute("PRAGMA foreign_keys = ON");
      },
    );

    return database;
  }

  Future<List<Map>> getTitle() async{
    final db = await database;
    final list = await db.rawQuery('SELECT * FROM title');
    return list;
  }
}
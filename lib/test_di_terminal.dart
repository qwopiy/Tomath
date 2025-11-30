import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'service/database_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final databasesPath = await getDatabasesPath();
  String path = join(databasesPath, "tomath_db.db");
  await deleteDatabase(path);

  final DatabaseService _dbs = DatabaseService.instance;
  final db = await _dbs.database;

  final playerCheck = await db.query('player');
  print('Baris di tabel player: $playerCheck');

  final skinCheck = await db.query('skin');
  print('Baris di tabel player: $skinCheck');

  final titleCheck = await db.query('title');
  print('Baris di tabel player: $titleCheck');

  final itemSkinCheck = await db.query('item_skin');
  print('Baris di tabel player: $itemSkinCheck');

  final itemTitleCheck = await db.query('item_title');
  print('Baris di tabel player: $itemTitleCheck');
}
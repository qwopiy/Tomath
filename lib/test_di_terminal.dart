// main.dart

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'service/database_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final DatabaseService _dbs = DatabaseService.instance;
  await _dbs.database;

  // Lakukan query terpisah yang sederhana untuk cek keberadaan data
  final db = await _dbs.database;
  final playerCheck = await db.query('player');
  print('Baris di tabel player: $playerCheck'); // Cek apakah ada baris

  Map<String, dynamic>? profile = await _dbs.getPlayerProfile();
  print('Hasil getPlayerProfile: $profile');
}
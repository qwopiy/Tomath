import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'service/database_service.dart';

Future<void> main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final DatabaseService _dbs = DatabaseService.instance;

  List<Map> list = await _dbs.getTitle();

  print(list);
}
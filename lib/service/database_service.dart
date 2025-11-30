import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
                    cost INTEGER,
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
                    cost INTEGER,
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
                    title_id INTEGER DEFAULT 1,
                    skin_id  INTEGER DEFAULT 1,
                    FOREIGN KEY (title_id) REFERENCES title(title_id) ON DELETE CASCADE,
                    FOREIGN KEY (skin_id) REFERENCES skin(skin_id) ON DELETE CASCADE
                )
              '''
          );

          await db.insert('skin', {'path': 'Tomath', 'is_unlocked': 1});
          await db.insert('skin', {'path': 'TomathUndead', 'is_unlocked': 0});
          await db.insert('skin', {'path': 'TomathPairPlay', 'is_unlocked': 0});

          await db.insert('title', {'name': 'Traveler', 'is_unlocked': 1});
          await db.insert('title', {'name': 'Ghost Buster', 'is_unlocked': 0});
          await db.insert('title', {'name': 'Borjuis', 'is_unlocked': 0});

          await db.insert('item_skin', {'skin_id': 3, 'cost' : 10000, 'is_purchased': 0});
          await db.insert('item_title', {'title_id': 3, 'cost' : 7000, 'is_purchased': 0});

          await db.insert('player', {'username': 'FreakyBug'});
      },
      onConfigure: (db) async {
        await db.execute("PRAGMA foreign_keys = ON");
      },
    );

    return database;
  }

  Future<Map<String, dynamic>?> getPlayerProfile() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT 
          P.username, 
          P.currency, 
          P.progress,
          T.name AS title_name,     
          S.path AS skin_path      
      FROM 
          player AS P
      
      LEFT JOIN 
          title AS T ON P.title_id = T.title_id
      
      LEFT JOIN 
          skin AS S ON P.skin_id = S.skin_id
          
      WHERE 
          P.player_id = 1 
      LIMIT 1;
  ''');

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<List<Map>> getItemTitle() async{
    final db = await database;
    final list = await db.rawQuery('''
      SELECT 
          IT.item_title_id, 
          IT.cost, 
          IT.is_purchased,
          T.name AS title_name,        
      FROM 
          item_title AS IT
      
      LEFT JOIN 
          title AS T ON IT.title_id = T.title_id
  ''');
    return list;
  }

  Future<List<Map>> getItemSkin() async{
    final db = await database;
    final list = await db.rawQuery('''
      SELECT 
          IS.item_title_id, 
          IS.cost, 
          IS.is_purchased,
          S.path AS skin_path,        
      FROM 
          item_skin AS IS
      
      LEFT JOIN 
          skin AS S ON IS.skin_id = S.skin_id
  ''');
    return list;
  }

  Future<List<Map>> getTitle() async{
    final db = await database;
    final list = await db.rawQuery('SELECT * FROM title');
    return list;
  }

  Future<List<Map>> getSkin() async{
    final db = await database;
    final list = await db.rawQuery('SELECT * FROM skin');
    return list;
  }

  Future<void> updateUnlockedTitle(int id) async{
    final db = await database;
    await db.update(
        'title',
        {'is_unlocked': 1},
        where: 'title_id = ?',
        whereArgs: [id]
    );
  }

  Future<void> updateUnlockedSkin(int id) async{
    final db = await database;
    await db.update(
        'skin',
        {'is_unlocked': 1},
        where: 'skin_id = ?',
        whereArgs: [id]
    );
  }

  Future<void> updatePlayerUsername(String username) async{
    final db = await database;
    await db.update(
        'player',
        {'username': username},
        where: 'player_id = ?',
        whereArgs: [1]
    );
  }

  Future<void> updatePlayerSkin(int id) async{
    final db = await database;
    await db.update(
        'player',
        {'skin_id': id},
        where: 'player_id = ?',
        whereArgs: [1]
    );
  }

  Future<void> updatePlayerTitle(int id) async{
    final db = await database;
    await db.update(
        'player',
        {'title_id': id},
        where: 'player_id = ?',
        whereArgs: [1]
    );
  }

}
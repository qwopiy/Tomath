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
                    FOREIGN KEY (progress) REFERENCES bab(bab_id) ON DELETE CASCADE,
                    FOREIGN KEY (title_id) REFERENCES title(title_id) ON DELETE CASCADE,
                    FOREIGN KEY (skin_id) REFERENCES skin(skin_id) ON DELETE CASCADE
                )
              '''
          );
          await db.execute(
              '''
                CREATE TABLE bab (
                    bab_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    chapter TEXT
                )
              '''
          );
          await db.execute(
              '''
                CREATE TABLE sub_bab (
                    sub_bab_id INTEGER PRIMARY KEY AUTOINCREMENT,
                    bab_id INTEGER NOT NULL,
                    before_winning_info TEXT,
                    after_winning_info TEXT,
                    enemy TEXT,
                    mission TEXT,
                    material TEXT,
                    reward INTEGER,
                    is_playable INTEGER,
                    is_finished INTEGER,
                    FOREIGN KEY (bab_id) REFERENCES bab(bab_id) ON DELETE CASCADE
                )
              '''
          );

          await db.insert('skin', {'path': 'Tomath', 'is_unlocked': 1});
          await db.insert('skin', {'path': 'TomathUndead', 'is_unlocked': 1});
          await db.insert('skin', {'path': 'TomathPairPlay', 'is_unlocked': 0});

          await db.insert('title', {'name': 'Traveler', 'is_unlocked': 1});
          await db.insert('title', {'name': 'Ghost Buster', 'is_unlocked': 1});
          await db.insert('title', {'name': 'Borjuis', 'is_unlocked': 0});

          await db.insert('item_skin', {'skin_id': 3, 'cost' : 10000, 'is_purchased': 0});
          await db.insert('item_title', {'title_id': 3, 'cost' : 7000, 'is_purchased': 0});

          await db.insert('bab', {'chapter' : 'Bilangan Bulat'});
          await db.insert('bab', {'chapter' : 'Bilangan Rasional'});
          await db.insert('bab', {'chapter' : 'Rasio'});
          await db.insert('bab', {'chapter' : 'UTS'});
          await db.insert('bab', {'chapter' : 'Bentuk Aljabar'});
          await db.insert('bab', {'chapter' : 'Kesebangunan'});
          await db.insert('bab', {'chapter' : 'Data dan Diagram'});
          await db.insert('bab', {'chapter' : 'UAS'});

          await db.insert('player', {'username': 'FreakyBug', 'currency' : 9999999});

          await db.insert('sub_bab',{
            'bab_id' : 1,
            'before_winning_info' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque maximus arcu tortor, nec efficitur ante tincidunt at. ',
            'after_winning_info' : 'Integer et metus eu felis maximus convallis. Morbi suscipit interdum ipsum. In eget placerat nibh',
            'enemy ' : 'Durian',
            'mission' : 'defeat all the bandits',
            'material' : 'garis bilangan (penjumlahan, pengurangan)',
            'reward' : 200,
            'is_playable' : 1,
            'is_finished' : 0
          });
          await db.insert('sub_bab',{
            'bab_id' : 1,
            'before_winning_info' : 'Sed ultricies lorem nisl, sodales rhoncus arcu consectetur quis. Vestibulum eget ipsum in diam vulputate maximus',
            'after_winning_info' : 'Aliquam faucibus facilisis blandit. Proin sagittis faucibus gravida. In ut eleifend eros. Proin suscipit ex sed lorem volutpat, ac imperdiet justo euismod',
            'enemy ' : 'Rambutan',
            'mission' : 'defeat all the bandits',
            'material' : 'perkalian, pembagian',
            'reward' : 250,
            'is_playable' : 0,
            'is_finished' : 0
          });
          await db.insert('sub_bab',{
            'bab_id' : 1,
            'before_winning_info' : ' Nullam tempus eget sapien in accumsan. Vivamus commodo nisi ut neque auctor vulputate. Vestibulum pulvinar purus a placerat condimentum.',
            'after_winning_info' : 'In commodo mauris dolor, eu imperdiet ipsum eleifend vitae. Aenean sed malesuada nulla, non euismod libero. Duis ac orci ornare, placerat erat at, fringilla orci',
            'enemy ' : 'Cactus',
            'mission' : 'defeat all the bandits',
            'material' : 'fpb, kpk',
            'reward' : 300,
            'is_playable' : 0,
            'is_finished' : 0
          });
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

  Future<List<Map<String, dynamic>>?> getBab() async{
    final db = await database;
    final List<Map<String, dynamic>> list = await db.rawQuery('SELECT * FROM bab');
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>?> getSubBab() async{
    final db = await database;
    final List<Map<String, dynamic>> list = await db.rawQuery('''
        SELECT 
          SB.*
        FROM 
          player AS P
        JOIN 
          sub_bab AS SB
        ON 
          P.progress = SB.bab_id
        WHERE 
          P.player_id = 1
  ''');
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>?> getItemTitle() async{
    final db = await database;
    final List<Map<String, dynamic>> list = await db.rawQuery('''
      SELECT 
          TI.item_title_id AS id, 
          TI.title_id AS content_id,
          TI.cost, 
          TI.is_purchased,
          T.name AS name        
      FROM 
          item_title AS TI
      LEFT JOIN 
          title AS T ON TI.title_id = T.title_id
  ''');
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>?> getItemSkin() async{
    final db = await database;
    final List<Map<String, dynamic>> list = await db.rawQuery('''
      SELECT 
          SI.item_skin_id AS id,
          SI.skin_id AS content_id, 
          SI.cost, 
          SI.is_purchased,
          S.path AS name        
      FROM 
          item_skin AS SI
      LEFT JOIN 
          skin AS S ON SI.skin_id = S.skin_id
  ''');
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>?> getTitle() async{
    final db = await database;
    final List<Map<String, dynamic>> list = await db.rawQuery('SELECT * FROM title');
    if (list.isNotEmpty) {
      return list;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>?> getSkin() async{
    final db = await database;
    final List<Map<String, dynamic>> list = await db.rawQuery('SELECT * FROM skin');
    if (list.isNotEmpty) {
      return list;
    }
    return null;
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

  Future<void> updatePurchasedTitle(int id) async{
    final db = await database;
    await db.update(
        'item_title',
        {'is_purchased': 1},
        where: 'item_title_id = ?',
        whereArgs: [id]
    );
  }

  Future<void> updatePurchasedSkin(int id) async{
    final db = await database;
    await db.update(
        'item_skin',
        {'is_purchased': 1},
        where: 'item_skin_id = ?',
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

  Future<void> updatePlayerCurrency(int newCurrency) async{
    final db = await database;
    await db.update(
        'player',
        {'currency': newCurrency},
        where: 'player_id = ?',
        whereArgs: [1]
    );
  }

  Future<void> updatePlayerProgress(int _progress) async{
    final db = await database;
    await db.update(
        'player',
        {'prograss': _progress},
        where: 'player_id = ?',
        whereArgs: [1]
    );
  }



}
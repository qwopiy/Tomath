import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/database_service.dart';
import '../models/player_model.dart';

class AppStateProvider extends ChangeNotifier {

  Player? _player;
  List<Map> _titles = [];
  List<Map> _skins = [];
  List<Map> _itemTitles = [];
  List<Map> _itemSkins = [];

  Player get player => _player!;
  List<Map> get titles => _titles;
  List<Map> get skins => _skins;
  List<Map> get itemTitles => _itemTitles;
  List<Map> get itemSkins => _itemSkins;


  AppStateProvider() {
    _loadInitialState();
  }

  void _loadInitialState() async {
    final DatabaseService dbs = DatabaseService.instance;
    await dbs.database;

    final Map<String, dynamic>? profileMap = await dbs.getPlayerProfile();
    if (profileMap != null) {
      _player = Player.fromMap(profileMap);
      print(_player.toString());
    } else {
      print("Warning: Player profile not found. Check DB initialization.");
    }

    final titles = await dbs.getTitle();
    _titles = titles;

    final skins = await dbs.getSkin();
    _skins = skins;

    // final itemTitles = await dbs.getItemTitle();
    // _itemTitles = itemTitles;
    //
    // final itemSkins = await dbs.getItemSkin();
    // _itemSkins = itemSkins;


    notifyListeners();

  }
}
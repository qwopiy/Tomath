import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/sub_bab_model.dart';
import '../service/database_service.dart';
import '../models/player_model.dart';

class AppStateProvider extends ChangeNotifier {
  static const String _soundVolume = 'sound_volume';
  static const String _musicVolume = 'music_volume';

  double _currentSoundVolume = 0.5;
  double _currentMusicVolume = 0.5;

  double get currentMusicVolume => _currentMusicVolume;
  double get currentSoundVolume => _currentSoundVolume;

  Player? _player;
  List<SubBabModel>? _subBabList = [];
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

    final prefs = await SharedPreferences.getInstance();
    _currentSoundVolume = prefs.getDouble(_soundVolume) ?? 0.5;
    _currentMusicVolume = prefs.getDouble(_musicVolume) ?? 0.5;

    final Map<String, dynamic>? profileMap = await dbs.getPlayerProfile();
    if (profileMap != null) {
      _player = Player.fromMap(profileMap);
      print(_player.toString());
    } else {
      print("Warning: Player profile not found. Check DB initialization.");
    }

    final List<Map<String, dynamic>>? subBabListMap = await dbs.getSubBab();
    if (subBabListMap != null) {
      for(final e in subBabListMap){
        _subBabList?.add(SubBabModel.fromMap(e));
      }
      for(final subBab in _subBabList!){
        print(subBab.toString());
      }
    } else {
      print("Warning: sub Bab not found. Check DB initialization.");
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

  Future<void> setUsername(String newName) async {
    if (_player == null) return;

    _player = Player(
      username: newName,
      skin_path: _player!.skin_path,
      title_name: _player!.title_name,
      currency: _player!.currency,
      progress:  _player!.progress,
    );

    final dbs = DatabaseService.instance;
    await dbs.updatePlayerUsername(newName);

    notifyListeners();
  }

  Future<void> setVolume(double newSoundVolume, double newMusicVolume) async{
    _currentSoundVolume =  newSoundVolume;
    _currentMusicVolume =  newMusicVolume;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setDouble(_soundVolume, newSoundVolume);
    await prefs.setDouble(_musicVolume, newMusicVolume);

    notifyListeners();
  }
}
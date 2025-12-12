import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart' hide Title;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/costumable_model.dart';
import '../models/sub_bab_model.dart';
import '../service/database_service.dart';
import '../models/player_model.dart';

class AppStateProvider extends ChangeNotifier {
  static const String _soundVolumeKey = 'sound_volume';
  static const String _musicVolumeKey = 'music_volume';
  static const String _buttonCampaignPosKey = 'button_campaign_pos';

  List<({double top, double right})> _currentButtonCampaignPos = [];
  List<({double top, double right})> get currentButtonCampaignPos => _currentButtonCampaignPos;

  double _currentSoundVolume = 0.5;
  double _currentMusicVolume = 0.5;

  double get currentMusicVolume => _currentMusicVolume;
  double get currentSoundVolume => _currentSoundVolume;

  Player? _player;
  List<SubBabModel>? _subBabList = [];
  List<Title>? _titles = [];
  List<Skin>? _skins = [];
  List<Map> _itemTitles = [];
  List<Map> _itemSkins = [];

  Player get player => _player!;
  List<SubBabModel> get subBabList => _subBabList!;
  List<Title>? get titles => _titles;
  List<Skin>? get skins => _skins;
  List<Map> get itemTitles => _itemTitles;
  List<Map> get itemSkins => _itemSkins;

  AppStateProvider() {
    _loadInitialState();
  }

  void _loadInitialState() async {
    final DatabaseService dbs = DatabaseService.instance;
    await dbs.database;

    final prefs = await SharedPreferences.getInstance();
    _currentSoundVolume = prefs.getDouble(_soundVolumeKey) ?? 0.5;
    _currentMusicVolume = prefs.getDouble(_musicVolumeKey) ?? 0.5;

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

    final List<Map<String, dynamic>>? titlesMap = await dbs.getTitle();
    if (titlesMap != null) {
      for(final e in titlesMap){
        _titles?.add(Title.fromMap(e));
      }
      for(final title in _titles!){
        print(title.toString());
      }
    } else {
      print("Warning: title not found. Check DB initialization.");
    }

    final List<Map<String, dynamic>>? skinsMap = await dbs.getSkin();
    if (skinsMap != null) {
      for(final e in skinsMap){
        _skins?.add(Skin.fromMap(e));
      }
      for(final skin in _skins!){
        print(skin.toString());
      }
    } else {
      print("Warning: skin not found. Check DB initialization.");
    }

    initializePositions( _subBabList!.length);

    notifyListeners();
  }

  Future<void> setPlayerTitle(String newTitleName, int newTitleId) async {
    if (_player == null) return;

    _player = Player(
      username: _player!.username,
      skin_path: _player!.skin_path,
      title_name: newTitleName,
      currency: _player!.currency,
      progress:  _player!.progress,
    );

    final dbs = DatabaseService.instance;
    await dbs.updatePlayerTitle(newTitleId);

    notifyListeners();
  }

  Future<void> setPlayerSkin(String newSkinName, int newSkinId) async {
    if (_player == null) return;

    _player = Player(
      username: _player!.username,
      skin_path: newSkinName,
      title_name: _player!.title_name,
      currency: _player!.currency,
      progress:  _player!.progress,
    );

    final dbs = DatabaseService.instance;
    await dbs.updatePlayerSkin(newSkinId);

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

    await prefs.setDouble(_soundVolumeKey, newSoundVolume);
    await prefs.setDouble(_musicVolumeKey, newMusicVolume);

    notifyListeners();
  }

  Future<void> initializePositions(int itemCount) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(_buttonCampaignPosKey)) {
      String? jsonString = prefs.getString(_buttonCampaignPosKey);

      if (jsonString != null) {
        List<dynamic> decodedList = jsonDecode(jsonString);

        if (decodedList.length == itemCount) {
          _currentButtonCampaignPos = decodedList.map((item) {
            return (
            top: (item['top'] as num).toDouble(),
            right: (item['right'] as num).toDouble(),
            );
          }).toList();

          notifyListeners();
          return;
        }
      }
    }

    _generateNewPositions(itemCount);
  }

  Future<void> _savePositionsToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    List<Map<String, double>> mapList = _currentButtonCampaignPos.map((pos) {
      return {
        'top': pos.top,
        'right': pos.right,
      };
    }).toList();

    String jsonString = jsonEncode(mapList);

    await prefs.setString(_buttonCampaignPosKey, jsonString);
  }

  void _generateNewPositions(int itemCount) {
    final Random random = Random();
    _currentButtonCampaignPos.clear();

    double topCurrentMin = 0.3;
    double topCurrentMax = 0.4;

    for (int index = 0; index < itemCount; index++) {
      double rightCurrentMin;
      double rightCurrentMax;

      if ((index + 1) % 2 == 1) {
        rightCurrentMin = 0.3;
        rightCurrentMax = 0.5;
      } else {
        rightCurrentMin = 0.0;
        rightCurrentMax = 0.2;
      }

      double topRange = topCurrentMax - topCurrentMin;
      double rightRange = rightCurrentMax - rightCurrentMin;

      double topRandomDouble = topCurrentMin + (random.nextDouble() * topRange);
      double rightRandomDouble = rightCurrentMin + (random.nextDouble() * rightRange);

      _currentButtonCampaignPos.add((top: topRandomDouble, right: rightRandomDouble));

      topCurrentMin -= 0.1;
      topCurrentMax -= 0.1;
    }

    _savePositionsToPrefs();
    notifyListeners();
  }
}
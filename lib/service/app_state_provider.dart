import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart' hide Title;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/costumable_model.dart';
import '../models/dialogue_model.dart';
import '../models/shop_item_model.dart';
import '../models/sub_bab_model.dart';
import '../service/database_service.dart';
import '../models/player_model.dart';

class AppStateProvider extends ChangeNotifier {
  static const String _buttonCampaignPosKey = 'button_campaign_pos';
  static const String _dialogProgressKey = 'dialog_progress';

  int _currentDialogIndex = 0;
  int get currentDialogIndex => _currentDialogIndex;

  List<Dialogue> _script = initialDialogues;
  Dialogue? get currentDialog => _script[_currentDialogIndex];

  List<({double top, double right})> _currentButtonCampaignPos = [];
  List<({double top, double right})> get currentButtonCampaignPos => _currentButtonCampaignPos;

  Player? _player;
  List<SubBabModel>? _subBabList = [];
  List<Title>? _titles = [];
  List<Skin>? _skins = [];
  List<ShopItem>? _shopItems = [];

  Player get player => _player!;
  List<SubBabModel> get subBabList => _subBabList!;
  List<Title>? get titles => _titles;
  List<Skin>? get skins => _skins;
  List<ShopItem>? get shopItems  => _shopItems ;

  AppStateProvider() {
    _loadInitialState();
  }

  void _loadInitialState() async {
    final DatabaseService dbs = DatabaseService.instance;
    await dbs.database;

    final prefs = await SharedPreferences.getInstance();
    _currentDialogIndex = 0;

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

    getTitles(dbs);

    getSkins(dbs);

    getShopItem(dbs);

    initializePositions( _subBabList!.length);

    notifyListeners();
  }

  Future<void> getShopItem(DatabaseService dbs) async{
    _shopItems = [];
    final List<Map<String, dynamic>>? itemTitlesMap = await dbs.getItemTitle();
    final List<Map<String, dynamic>>? itemSkinsMap = await dbs.getItemSkin();
    if(itemTitlesMap != null){
      for(final e in itemTitlesMap){
        _shopItems?.add(ShopItem.fromMap(e, 1));
      }
    }else {
      print("Warning: item title not found. Check DB initialization.");
    }

    if(itemSkinsMap != null){
      for(final e in itemSkinsMap){
        _shopItems?.add(ShopItem.fromMap(e, 2));
      }
    }else {
      print("Warning: skin title not found. Check DB initialization.");
    }

    for(final item in _shopItems!){
      print(item.toString());
    }
  }

  Future<void> getTitles(DatabaseService dbs) async{
    _titles = [];
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
  }

  Future<void> getSkins(DatabaseService dbs) async{
    _skins = [];
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

  Future<void> updateTitle(int id) async{
    final dbs = DatabaseService.instance;
    await dbs.updateUnlockedTitle(id);
    getTitles(dbs);
    notifyListeners();
  }

  Future<void> updateSkin(int id) async{
    final dbs = DatabaseService.instance;
    await dbs.updateUnlockedSkin(id);
    getSkins(dbs);
    notifyListeners();
  }

  Future<void> updateShopItem(int item_id, int content_id, int category) async{
    final dbs = DatabaseService.instance;
    if(category == 1){
      await dbs.updatePurchasedTitle(item_id);
      updateTitle(content_id);
    }else if (category == 2){
      await dbs.updatePurchasedSkin(item_id);
      updateSkin(content_id);
    }
    getShopItem(dbs);
  }

  Future<void> updatePlayerProgress() async{
    if (_player == null) return;

    _player = Player(
      username: _player!.username,
      skin_path: _player!.skin_path,
      title_name: _player!.title_name,
      currency: _player!.currency,
      progress:  _player!.progress + 1,
    );

    final dbs = DatabaseService.instance;
    await dbs.updatePlayerProgress(_player!.progress + 1);

    notifyListeners();
  }

  Future<void> updatePlayerCurrency(int amount) async{
    if (_player == null) return;

    int newCurrency = _player!.currency + amount;

    _player = Player(
      username: _player!.username,
      skin_path: _player!.skin_path,
      title_name: _player!.title_name,
      currency: newCurrency,
      progress:  _player!.progress + 1,
    );

    final dbs = DatabaseService.instance;
    await dbs.updatePlayerCurrency(newCurrency);

    notifyListeners();
  }

  Future<void> updatePlayableLevel(int level) async{
    final dbs = DatabaseService.instance;
    for(int i = level; i <= level + 1; i++){
      if(i > 3) return;

      int _is_playable = 0;
      int _is_finished = 0;
      if(i == level){
        _is_playable = 1;
        _is_finished = 1;
      }else{
        _is_playable = 1;
        _is_finished = 0;
      }

      _subBabList![i] = SubBabModel(
          sub_bab_id: _subBabList![i].sub_bab_id,
          bab_id: _subBabList![i].bab_id,
          before_winning_info: _subBabList![i].before_winning_info,
          after_winning_info: _subBabList![i].after_winning_info,
          enemy: _subBabList![i].enemy,
          mission: _subBabList![i].mission,
          material: _subBabList![i].material,
          reward: _subBabList![i].reward,
          is_playable: _is_playable,
          is_finished: _is_finished,
      );

      dbs.updatePlayableSubBab(_is_playable, _is_finished, _subBabList![i].sub_bab_id);
    }
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

  void setProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_dialogProgressKey, _currentDialogIndex);
    print(_currentDialogIndex);
  }

  void nextDialog() {
    if (_currentDialogIndex < _script.length - 1) {
      _currentDialogIndex++;
      setProgress();
      notifyListeners();
    } else {
      print("Dialog Selesai!");
    }
  }

  String getProcessedText() {
    if (_currentDialogIndex >= _script.length) return "";

    String rawText = currentDialog?.text as String;

    if (rawText.contains('[PLAYER_NAME]')) {
      return rawText.replaceAll('[PLAYER_NAME]', player.username);
    }
    return rawText;
  }

}
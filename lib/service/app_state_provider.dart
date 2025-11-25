import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/database_service.dart';
import '../models/player_model.dart';

class AppStateProvider extends ChangeNotifier {

  Player? _player;
  Player get player => _player!;

  AppStateProvider() {
    _loadInitialState();
  }

  void _loadInitialState() async {
    final DatabaseService dbs = DatabaseService.instance;
    await dbs.database;

    final Map<String, dynamic>? profileMap = await dbs.getPlayerProfile();

    if (profileMap != null) {
      _player = Player.fromMap(profileMap);
    } else {
      print("Warning: Player profile not found. Check DB initialization.");
    }

    notifyListeners();

  }
}
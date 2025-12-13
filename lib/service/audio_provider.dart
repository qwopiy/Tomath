import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppMusic {
  static const String homeTheme = 'audio/bgm/my_istri_song_1.mp3';
  static const String gameTheme = 'audio/bgm/my_istri_song_2.mp3';
}

class AudioProvider extends ChangeNotifier with WidgetsBindingObserver {
  final AudioPlayer _bgmPlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();

  static const String _bgmPlayerKey = 'bgm_volume';
  static const String _sfxPlayerKey = 'sfx_volume';

  double _bgmVolume = 0.5;
  double _sfxVolume = 0.5;
  String? _currentBgmSource;

  double get bgmVolume => _bgmVolume;
  double get sfxVolume => _sfxVolume;

  AudioProvider() {
    _configureAudioContext();

    _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    _loadVolumeFromPrefs();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _configureAudioContext() async {
    final AudioContext audioContext = AudioContext(
      android: AudioContextAndroid(
        isSpeakerphoneOn: true,
        stayAwake: true,
        contentType: AndroidContentType.sonification,
        usageType: AndroidUsageType.game,
        audioFocus: AndroidAudioFocus.none,
      ),
    );

    await AudioPlayer.global.setAudioContext(audioContext);
  }

  Future<void> _loadVolumeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    _bgmVolume = prefs.getDouble(_bgmPlayerKey) ?? 0.5;
    _sfxVolume = prefs.getDouble(_sfxPlayerKey) ?? 0.5;

    await _bgmPlayer.setVolume(_bgmVolume);
    notifyListeners();
  }

  Future<void> setBgmVolume(double value) async {
    final prefs = await SharedPreferences.getInstance();

    _bgmVolume = value;
    await _bgmPlayer.setVolume(value);

    await prefs.setDouble(_bgmPlayerKey, value);
    notifyListeners();
  }

  Future<void> setSfxVolume(double value) async {
    final prefs = await SharedPreferences.getInstance();
    _sfxVolume = value;

    await prefs.setDouble(_sfxPlayerKey, value);
    notifyListeners();
  }

  Future<void> playBgm(String assetPath) async {
    if (_currentBgmSource == assetPath) {
      return;
    }

    try {
      await _bgmPlayer.stop();
      _currentBgmSource = assetPath;

      await _bgmPlayer.setSource(AssetSource(assetPath));
      await _bgmPlayer.setVolume(_bgmVolume);
      await _bgmPlayer.resume();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  Future<void> playSfx(String assetPath) async {
    if (_sfxVolume > 0) {
      await _sfxPlayer.setReleaseMode(ReleaseMode.stop);
      await _sfxPlayer.setVolume(_sfxVolume);
      await _sfxPlayer.play(AssetSource(assetPath));
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _bgmPlayer.pause();
    } else if (state == AppLifecycleState.resumed) {
      _bgmPlayer.resume();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _bgmPlayer.dispose();
    _sfxPlayer.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomath/widget/game_widget.dart';

import '../models/materi.dart';
import '../service/app_state_provider.dart';
import '../service/audio_provider.dart';

class GameScreen extends StatefulWidget{
  final GameType gameType;
  final int bab;
  final int subBab;
  final String? enemyType;
  const GameScreen({
    super.key,
    required this.gameType,
    required this.bab,
    required this.subBab,
    this.enemyType,
  });

  @override
  State<GameScreen> createState() => _CampaignGameScreenState();
}

class _CampaignGameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AudioProvider>().playBgm(AppMusic.gameTheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    String enemyType = widget.enemyType ?? '';

    final appStateProvider = Provider.of<AppStateProvider>(context, listen: false);
    if (widget.gameType == GameType.campaign) {
      enemyType = appStateProvider.subBabList[widget.subBab - 1].enemy;
    }
    return GameWidget(
      bab: widget.bab,
      subBab: widget.subBab,
      gameType: widget.gameType,
      enemyType: enemyType,
      rewards: appStateProvider.subBabList[widget.subBab - 1].reward
    );
  }
}
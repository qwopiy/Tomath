import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomath/widget/game_widget.dart';

import '../service/audio_provider.dart';

class CampaignGameScreen extends StatefulWidget{
  final int bab;
  final int subBab;
  const CampaignGameScreen({
    super.key,
    required this.bab,
    required this.subBab,
  });

  @override
  State<CampaignGameScreen> createState() => _CampaignGameScreenState();
}

class _CampaignGameScreenState extends State<CampaignGameScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AudioProvider>().playBgm(AppMusic.gameTheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      bab: widget.bab,
      subBab: widget.subBab,
      // isEvent: false,
      // isTraining: false,
    );
  }
}
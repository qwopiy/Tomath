import 'package:flutter/material.dart';
import 'package:tomath/widget/game_widget.dart';

class CampaignGameScreen extends StatelessWidget{
  final int bab;
  final int subBab;
  const CampaignGameScreen({
    super.key,
    required this.bab,
    required this.subBab,
  });

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      bab: bab,
      subBab: subBab,
      // isEvent: false,
      // isTraining: false,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tomath/widget/game_widget.dart';

class CampaignScreen extends StatelessWidget{
  final int bab;
  const CampaignScreen({
    super.key,
    required this.bab,
  });

  @override
  Widget build(BuildContext context) {
    return GameWidget(bab: bab);
  }
}
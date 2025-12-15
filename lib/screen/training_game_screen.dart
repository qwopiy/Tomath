import 'package:flutter/material.dart';

import '../widget/game_widget.dart';

class TrainingGameScreen extends StatelessWidget{
  final int bab;
  final int subBab;
  const TrainingGameScreen({
    super.key,
    required this.bab,
    required this.subBab,
  });

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      bab: bab,
      subBab: subBab,
      isTraining: true,
      enemyType: "Banana"
    );
  }
}
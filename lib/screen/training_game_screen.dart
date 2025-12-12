import 'package:flutter/material.dart';
import 'package:tomath/widget/game_widget.dart';

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
      // TODO: enemy type: "Pisang" pas ada
    );
  }
}
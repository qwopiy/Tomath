import 'package:flutter/material.dart';
import 'package:tomath/widget/game_widget.dart';

class TrainingGameScreen extends StatelessWidget{
  final int bab;
  const TrainingGameScreen({
    super.key,
    required this.bab,
  });

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      bab: bab,
      isTraining: true,
    );
  }
}
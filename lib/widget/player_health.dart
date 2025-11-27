import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomath/provider/quiz_provider.dart';

class PlayerHealth extends StatefulWidget {
  bool? isTraining;
  PlayerHealth({
    super.key,
    this.isTraining
  });

  @override
  State<PlayerHealth> createState() => _PlayerHealthState();
}

class _PlayerHealthState extends State<PlayerHealth> {
  @override
  Widget build(BuildContext context) {
    if (widget.isTraining == null || widget.isTraining == true) {
      return Container();
    }
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        int health = Provider
            .of<QuizProvider>(context)
            .health;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              color: (health > 0) ? Colors.red : Colors.black,
              size: kToolbarHeight - 20,
            ),
            Icon(
              Icons.favorite,
              color: (health > 1) ? Colors.red : Colors.black,
              size: kToolbarHeight - 20,
            ),
            Icon(
              Icons.favorite,
              color: (health > 2) ? Colors.red : Colors.black,
              size: kToolbarHeight - 20,
            ),
          ],
        );
      }
    );
  }
}
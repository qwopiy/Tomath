import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomath/provider/quiz_provider.dart';

class PlayerHealth extends StatefulWidget {
  const PlayerHealth({super.key});

  @override
  State<PlayerHealth> createState() => _PlayerHealthState();
}

class _PlayerHealthState extends State<PlayerHealth> {
  Widget build(BuildContext context) {
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
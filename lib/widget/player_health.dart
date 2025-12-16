import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/materi.dart';
import '../provider/quiz_provider.dart';

class PlayerHealth extends StatefulWidget {
  final GameType? gameType;
  const PlayerHealth({
    super.key,
    this.gameType
  });

  @override
  State<PlayerHealth> createState() => _PlayerHealthState();
}

class _PlayerHealthState extends State<PlayerHealth> {
  @override
  Widget build(BuildContext context) {
    if (widget.gameType == GameType.training) {
      return SizedBox(
        height: 20,
        width: MediaQuery.of(context).size.width / 4,
      );
    }
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        int health = Provider
            .of<QuizProvider>(context)
            .health;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'HP : ',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'LuckiestGuy',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              Icons.favorite,
              color: (health > 0) ? Colors.red : Colors.black,
              size: 20,
            ),
            Icon(
              Icons.favorite,
              color: (health > 1) ? Colors.red : Colors.black,
              size: 20,
            ),
            Icon(
              Icons.favorite,
              color: (health > 2) ? Colors.red : Colors.black,
              size: 20,
            ),
          ],
        );
      }
    );
  }
}
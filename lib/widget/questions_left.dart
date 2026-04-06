import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/materi.dart';
import '../provider/quiz_provider.dart';

class QuestionsLeft extends StatefulWidget {
  final GameType? gameType;
  const QuestionsLeft({
    super.key,
    this.gameType
  });

  @override
  State<QuestionsLeft> createState() => _QuestionsLeftState();
}

class _QuestionsLeftState extends State<QuestionsLeft> {
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
          int curQuestionNum = 10 - Provider
              .of<QuizProvider>(context)
              .questionRemaining;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '$curQuestionNum / 10',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'LuckiestGuy',
                    color: Color(0xFFEFEEC8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }
    );
  }
}
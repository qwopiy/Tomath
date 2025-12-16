import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/materi.dart';
import '../provider/quiz_provider.dart';

class TrainingPopup extends StatelessWidget {
  final int subBab;
  final String resultText;
  final String descriptionText;
  final String solutionText;

  const TrainingPopup({
    super.key,
    required this.subBab,
    required this.resultText,
    required this.descriptionText,
    required this.solutionText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Popup Box
            Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/ui/KertasGede.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Description
                  Text(
                    descriptionText,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Solution
                  Text(
                    solutionText,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 60),
                  // Button OK
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () async {
                    final quiz = Provider.of<QuizProvider>(context, listen: false);
                    GoRouter.of(context).pop();
                    await Future.delayed(const Duration(milliseconds: 100)); // delay agar jawaban selanjutnya tidak langsung nampak
                    if (context.mounted) {
                      quiz.nextQuestion(context, subBab, 0);
                    }
                  },
                  child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/ui/NavbarKayu.png'),
                            fit: BoxFit.fill
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

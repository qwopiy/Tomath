import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tomath/widget/result_popup.dart';
import 'package:tomath/widget/training_popup.dart';

import '../models/question.dart';
import 'app_database.dart';

class QuizProvider extends ChangeNotifier {
  List<Question> _questions = List.filled(
    50,
    Question(
      id: 0,
      text: '',
      options: ['', '', '', ''],
      correctAnswer: '',
      solutionText: '',
    ),
    growable: true
  );

  int _currentQuestionIndex = 0;

  String question = '';
  List<String> options = [
    '',
    '',
    '',
    ''
  ];
  String correctAnswer = '';
  String solutionText = '';

  int _questionRemaining = 10;
  int _health = 3;

  int get questionRemaining => _questionRemaining;
  int get health => _health;

  void setQuestion(String question, List<String> options, String correctAnswer, String solutionText) {
    if (_health <= 0 || _questionRemaining <= 0) return;
    this.question = question;
    this.options = options;
    this.correctAnswer = correctAnswer;
    this.solutionText = solutionText;
    // print("Setting question to index $_currentQuestionIndex");
    // print("Question: $question");
    // print("Options: $options");
    notifyListeners();
  }

  void nextQuestion(BuildContext context, [bool? isTraining]) {
    if (isTraining != null && isTraining) return;
    if (_currentQuestionIndex < _questions.length - 1 && (_health > 0 && _questionRemaining > 0)) {
      // print("Next question called");
      _currentQuestionIndex++;
      _questionRemaining--;

      _currentQuestionIndex = Random().nextInt(_questions.length);

      setQuestion(
        _questions[_currentQuestionIndex].text,
        _questions[_currentQuestionIndex].options,
        _questions[_currentQuestionIndex].correctAnswer,
        _questions[_currentQuestionIndex].solutionText,
      );
      notifyListeners();
      // print("Moved to question index $_currentQuestionIndex");
      // print("Question remaining: $_questionRemaining");
    } else {
      // out of questions or health
      if (_health <= 0) {
        // Lose
        showResult(
          context,
          'GAME OVER',
          'You have run out of health.',
          0
        );
        print("No health remaining. Game over.");
      } else {
        // Win
        showResult(
          context,
          'SUCCESS!',
          'You answered correctly.',
          100
        );
        print("No questions remaining.");
      }
    }
  }

  void optionSelected(int index, [bool? isTraining, BuildContext? context]) {
    if (_health <= 0 || _questionRemaining <= 0) return;
    String selectedOption = options[index];
    if (selectedOption != correctAnswer) {
      if (isTraining == null || !isTraining) {
        _health--;
      }
      print("correctAnswer: $correctAnswer");
      print("Incorrect answer selected. Health decreased to $_health");
      if (isTraining != null && context != null && isTraining) {
        showAnswer(context, false);
      }
    } else {
      print("Correct answer selected.");
      if (isTraining != null && context != null && isTraining) {
        showAnswer(context, true);
      }
    }
    notifyListeners();
  }
  
  void showResult(BuildContext context, String resultText, String descriptionText, int reward) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ResultPopup(
        resultText: resultText, 
        descriptionText: descriptionText,
        reward: reward,
      ),
    );
  }

  void showAnswer(BuildContext context, bool answeredRight) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => TrainingPopup(
        resultText: answeredRight ? 'Correct!' : 'Wrong!',
        descriptionText: 'The correct answer is: $correctAnswer',
        solutionText: solutionText,
      ),
    );
  }

  Future<void> resetQuestion(int bab, int subBab) async {
    await getQuestionsByBabSubBab(bab, subBab);
    // await getQuestionDatabase();
    resetStats();
    // print("currentQuestionIndex set to $_currentQuestionIndex");
    // print("Total questions loaded: ${_questions.length}");

    setQuestion(
      _questions[_currentQuestionIndex].text,
      _questions[_currentQuestionIndex].options,
      _questions[_currentQuestionIndex].correctAnswer,
      _questions[_currentQuestionIndex].solutionText,
    );
    // print("Quiz provider reset complete");
    notifyListeners();
  }

  Future<void> resetStats() async {
    _questionRemaining = _questions.length;
    _health = 3;
    _currentQuestionIndex = Random().nextInt(_questions.length);
    notifyListeners();
  }

  void setBab(int bab ,int subBab) {
    resetQuestion(bab, subBab);
  }

  Future<void> getQuestionDatabase() async {
    final questionMaps = await AppDatabase.instance.getQuestions();
    _questions = questionMaps
      .map((m) => Question.fromJSON(m as Map<String, dynamic>))
      .toList();
  }

  Future<void> getQuestionsByBabSubBab(int bab, int subBab) async {
    final questionMaps = await AppDatabase.instance.getQuestionsByBabSubBab(bab, subBab);
    _questions = questionMaps
      .map((m) => Question.fromJSON(m as Map<String, dynamic>))
      .toList();
  }
}
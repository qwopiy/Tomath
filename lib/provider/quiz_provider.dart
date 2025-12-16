import 'dart:math';

import 'package:flutter/material.dart';
import '../models/materi.dart';
import '../widget/result_popup.dart';
import '../widget/training_popup.dart';

import '../models/question.dart';
import 'quiz_database.dart';

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

  Question currentQuestion = Question.blank();

  int _questionRemaining = 10;
  int _health = 3;

  int get currentQuestionIndex => _currentQuestionIndex;

  int get questionRemaining => _questionRemaining;
  int get health => _health;

  void setQuestion(String question, List<String> options, String correctAnswer, String solutionText) {
    if (_health <= 0 || _questionRemaining <= 0) return;
    currentQuestion.text = question;
    currentQuestion.options = options;
    currentQuestion.options.shuffle();

    currentQuestion.correctAnswer = correctAnswer;
    currentQuestion.solutionText = solutionText;
    notifyListeners();
  }

  void nextQuestion(BuildContext context, int level, int rewards, [GameType? gameType]) {
    if (gameType == GameType.training) return;

    if (_currentQuestionIndex < _questions.length - 1 && (_health > 0 && _questionRemaining > 1)) {
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
      print("Question remaining: $_questionRemaining");
    } else {
      // out of questions or health
      if (_health <= 0) {
        /// Lose
        showResult(
          context,
          'GAME OVER',
          'You have run out of health.',
          0,
          level
        );
        print("No health remaining. Game over.");
      } else {
        /// Win
        showResult(
          context,
          'SUCCESS!',
          'You answered correctly.',
          rewards,
          level
        );
        print("No questions remaining.");
      }
    }
  }

  bool validateAnswer(String input) {
    String inputLower = input.toLowerCase();

    // Remove non-numeric characters dari input
    String inputNum = inputLower.replaceAll(RegExp(r'[^0-9]'), '');
    if (input == '' || inputNum == '') return false;

    String correctAnswerLower = currentQuestion.correctAnswer.toLowerCase();

    return (inputLower == correctAnswerLower) ||
        (correctAnswerLower.contains(inputLower)) ||
        (correctAnswerLower.contains(inputNum));
  }

  void optionSelected(int index, int level, [GameType? gameType, BuildContext? context]) {
    if (_health <= 0 || _questionRemaining <= 0) return;
    if (isCorrectAnswer(index)) {
      /// Correct Answer
      if (gameType == GameType.training && context != null) {
        showAnswer(context, true, level);
      }
    } else {
      /// Wrong Answer
      if (gameType != GameType.training) {
        _health--;
      }

      if (gameType == GameType.training && context != null) {
        showAnswer(context, false, level);
      }
    }
    notifyListeners();
  }

  void answerGiven(String input, int level, [GameType? gameType, BuildContext? context]) {
    if (_health <= 0 || _questionRemaining <= 0) return;
    if (validateAnswer(input)) {
        /// Correct Answer
      if (gameType == GameType.training && context != null) {
        showAnswer(context, true, level);
      }
    } else {
      /// Wrong Answer
      if (gameType != GameType.training) {
        _health--;
      }

      if (gameType == GameType.training && context != null) {
        showAnswer(context, false, level);
      }
    }
    notifyListeners();
  }

  bool isCorrectAnswer(int index) {
    return currentQuestion.options[index] == currentQuestion.correctAnswer;
  }

  void showResult(BuildContext context, String resultText, String descriptionText, int reward, int level) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ResultPopup(
        level: level,
        resultText: resultText,
        descriptionText: descriptionText,
        reward: reward,
      ),
    );
  }

  void showAnswer(BuildContext context, bool answeredRight, int level) async {
    await Future.delayed(Duration(seconds: 1));
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => TrainingPopup(
        resultText: answeredRight ? 'Benar!' : 'Salah!',
        descriptionText: 'Jawaban yang benar adalah: ${currentQuestion.correctAnswer}',
        solutionText: currentQuestion.solutionText,
        subBab: level
      ),
    );
  }

  void resetQuestion() {
    resetStats();

    setQuestion(
      _questions[_currentQuestionIndex].text,
      _questions[_currentQuestionIndex].options,
      _questions[_currentQuestionIndex].correctAnswer,
      _questions[_currentQuestionIndex].solutionText,
    );
    notifyListeners();
  }

  void resetStats() {
    _questionRemaining = 3; // batas 10 pertanyaan
    _health = 3;
    _currentQuestionIndex = Random().nextInt(_questions.length);
    notifyListeners();
  }

  void setBankSoal(GameType gameType, [int? bab, int? subBab]) async {
    switch (gameType) {
      case GameType.campaign:
        await getQuestionsByBabSubBab(bab!, subBab!);
        break;
      case GameType.training:
        await getQuestionsByBabSubBab(bab!, subBab!);
        break;
      case GameType.event:
        await getQuestionsByBabSubBab(bab!, subBab!);
        break;
      case GameType.UTS:
        await getUTSQuestion();
        break;
      case GameType.UAS:
        await getUASQuestion();
        break;
    }
    resetQuestion();
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

  Future<void> getUTSQuestion() async {
    final questionMaps = await AppDatabase.instance.getUTSQuestion();
    _questions = questionMaps
      .map((m) => Question.fromJSON(m as Map<String, dynamic>))
      .toList();
  }

  Future<void> getUASQuestion() async {
    final questionMaps = await AppDatabase.instance.getUASQuestion();
    _questions = questionMaps
      .map((m) => Question.fromJSON(m as Map<String, dynamic>))
      .toList();
  }
}
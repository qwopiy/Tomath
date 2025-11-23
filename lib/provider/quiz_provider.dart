import 'dart:math';

import 'package:flutter/material.dart';

import '../models/question.dart';
import 'app_database.dart';

class QuizProvider extends ChangeNotifier {
  List<Question> _questions = List.filled(
    30,
    Question(
      id: 0,
      text: '',
      options: ['', '', '', ''],
      correctAnswer: ''
    ),
    growable: true
  );

  int _currentQuestionIndex = 0;

  String _question = '';
  List<String> _options = [
    '',
    '',
    '',
    ''
  ];
  int _questionRemaining = 5;
  int _health = 3;

  String get question => _question;
  List<String> get options => _options;
  int get questionRemaining => _questionRemaining;
  int get health => _health;

  void setQuestion(String question, List<String> options) {
    if (_health <= 0 || _questionRemaining <= 0) return;
    _question = _questions[_currentQuestionIndex].text;
    _options = _questions[_currentQuestionIndex].options;
    print("Setting question to index $_currentQuestionIndex");
    print("Question: $question");
    print("Options: $options");
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1 && (_health > 0 && _questionRemaining > 0)) {
      print("Next question called");
      _currentQuestionIndex++;
      _questionRemaining--;

      _currentQuestionIndex = Random().nextInt(_questions.length);

      setQuestion(_questions[_currentQuestionIndex].text, _questions[_currentQuestionIndex].options);
      notifyListeners();
      print("Moved to question index $_currentQuestionIndex");
      print("Question remaining: $_questionRemaining");
    }
  }

  // TOD0: bug: question tak muncul di flutter
  Future<void> reset() async {
    await getQuestionsById(100, 200);
    _questionRemaining = _questions.length;
    _health = 3;
    _currentQuestionIndex = 0;
    setQuestion(_questions[_currentQuestionIndex].text, _questions[_currentQuestionIndex].options);
    notifyListeners();
  }

  Future<void> getQuestionDatabase() async {
    final questionMaps = await AppDatabase.instance.getQuestions();
    _questions = questionMaps
      .map((m) => Question.fromJSON(m as Map<String, dynamic>))
      .toList();
  }

  Future<void> getQuestionsById(int min, int max) async {
    final questionMaps = await AppDatabase.instance.getQuestionsById(min, max);
    _questions = questionMaps
      .map((m) => Question.fromJSON(m as Map<String, dynamic>))
      .toList();
  }
}
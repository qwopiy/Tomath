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

  String question = '';
  List<String> options = [
    '',
    '',
    '',
    ''
  ];
  String correctAnswer = '';

  int _questionRemaining = 5;
  int _health = 3;

  int get questionRemaining => _questionRemaining;
  int get health => _health;

  void setQuestion(String question, List<String> options, String correctAnswer) {
    if (_health <= 0 || _questionRemaining <= 0) return;
    this.question = question;
    this.options = options;
    this.correctAnswer = correctAnswer;
    // print("Setting question to index $_currentQuestionIndex");
    // print("Question: $question");
    // print("Options: $options");
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1 && (_health > 0 && _questionRemaining > 0)) {
      // print("Next question called");
      _currentQuestionIndex++;
      _questionRemaining--;

      _currentQuestionIndex = Random().nextInt(_questions.length);

      setQuestion(
        _questions[_currentQuestionIndex].text,
        _questions[_currentQuestionIndex].options,
        _questions[_currentQuestionIndex].correctAnswer
      );
      notifyListeners();
      // print("Moved to question index $_currentQuestionIndex");
      // print("Question remaining: $_questionRemaining");
    }
  }

  void optionSelected(int index) {
    if (_health <= 0 || _questionRemaining <= 0) return;
    String selectedOption = options[index];
    if (selectedOption != correctAnswer) {
      _health--;
      print("correctAnswer: $correctAnswer");
      print("Incorrect answer selected. Health decreased to $_health");
    } else {
      print("Correct answer selected.");
    }
    notifyListeners();
  }

  Future<void> resetQuestion(int idMin, int idMax) async {
    await getQuestionsById(idMin, idMax);
    // await getQuestionDatabase();
    resetStats();
    // print("currentQuestionIndex set to $_currentQuestionIndex");
    // print("Total questions loaded: ${_questions.length}");

    setQuestion(
      _questions[_currentQuestionIndex].text,
      _questions[_currentQuestionIndex].options,
      _questions[_currentQuestionIndex].correctAnswer
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
import 'package:flutter/cupertino.dart';

class QuizProvider extends ChangeNotifier {
  String _question = '';
  List<String> _choices = [
    '',
    '',
    '',
    ''
  ];
  int questionRemaining = 5;
  int _health = 3;

  String get question => _question;
  List<String> get choices => _choices;
  int get health => _health;

  void setQuestion(String question, List<String> choices) {
    if (_health <= 0) return;
    _question = question;
    _choices = choices;
    notifyListeners();
  }

  void test() {
    _question = 'Test Question';
    _choices = ['Choice 1', 'Choice 2', 'Choice 3', 'Choice 4'];
    notifyListeners();
    print("QuestionProvider is working");
  }

  void reset() {
    _question = 'Question not loaded';
    _choices = ['A', 'B', 'C', 'D'];
    notifyListeners();
  }
}
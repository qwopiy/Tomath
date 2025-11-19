class Question {
  final String id;
  final String text;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctAnswer,
  });

  String getQuestionText() {
    return text;
  }

  List<String> getOptions() {
    return options;
  }

  bool isCorrect(String answer) {
    return answer == correctAnswer;
  }

  factory Question.fromJSON(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      text: map['text'],
      options: List<String>.from(map['options']),
      correctAnswer: map['correctAnswer'],
    );
  }
}
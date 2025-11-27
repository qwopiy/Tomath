class Question {
  final int id;
  final String text;
  final List<String> options;
  final String correctAnswer;
  final String solutionText;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctAnswer,
    required this.solutionText,
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
    String optionsString = map['option'];
    List<String> optionsList = optionsString.split(', ');
    return Question(
      id: map['id'],
      text: map['problem'],
      options: optionsList,
      correctAnswer: map['answer'],
      solutionText: map['solution'],
    );
  }
}
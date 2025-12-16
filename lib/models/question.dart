class Question {
  int id;
  String text;
  List<String> options;
  String correctAnswer;
  String solutionText;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctAnswer,
    required this.solutionText,
  });

  Question.blank() :
    id = 0,
    text = '',
    options = [
      '',
      '',
      '',
      ''
    ],
    correctAnswer = '',
    solutionText = '';

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
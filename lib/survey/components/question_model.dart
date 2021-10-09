class Question {
  int number;
  String question;
  bool inputAnswer;
  List<String>? answers;
  String? userAnswer;

  Question(
      {required this.number,
      required this.question,
      required this.inputAnswer,
      this.answers,
      this.userAnswer});
}

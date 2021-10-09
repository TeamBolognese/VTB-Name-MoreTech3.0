class Question {
  final int number;
  final String question;
  final bool inputAnswer;
  final List<String>? answers;

  Question(
      {required this.number,
      required this.question,
      required this.inputAnswer,
      this.answers});
}

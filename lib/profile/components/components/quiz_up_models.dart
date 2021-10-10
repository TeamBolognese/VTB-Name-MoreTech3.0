class QuizUpAnswer {
  final String title;
  final String subtitle;
  final String comment;
  final double award;
  final double loss;
  final double fail;

  QuizUpAnswer(
      {required this.title,
      required this.subtitle,
      required this.comment,
      required this.award,
      required this.loss,
      required this.fail});
}

class QuizUpQuestion {
  final String question;
  final List<QuizUpAnswer> answers;

  QuizUpQuestion({required this.question, required this.answers});
}

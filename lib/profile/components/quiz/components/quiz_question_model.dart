import 'package:moretech_app/profile/components/quiz/components/quiz_true_answer_model.dart';

class QuizQuestion {
  final String question;
  final List<String> answers;
  final List<QuizTrueAnswer> trueAnswer;
  final double award;

  QuizQuestion(
      {required this.question,
      required this.answers,
      required this.trueAnswer,
      required this.award});

  String exp() {
    String out = "";
    for (var item in trueAnswer) {
      out += item.explanation + " ";
    }
    return out;
  }
}

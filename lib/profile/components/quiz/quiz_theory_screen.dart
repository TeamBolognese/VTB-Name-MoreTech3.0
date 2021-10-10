import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/profile/components/quiz/components/quiz_provider.dart';
import 'package:moretech_app/profile/components/quiz/quiz_correct_screen.dart';
import 'package:moretech_app/profile/components/quiz/quiz_wrong_screen.dart';

class QuizTheoryScreen extends StatelessWidget {
  QuizTheoryScreen({Key? key, required this.waterNotifier}) : super(key: key);

  final ValueNotifier<int> waterNotifier;

  String _answerPresentView(String str) {
    var split = str.split(" ");
    var out = "${split[0]} ${split[1]}";

    // out = out.replaceAll(',', '');

    return out;
  }

  double _calcListViewHeigth(List<String> answers) {
    var height = 0.0;

    for (var item in answers) {
      height += item.length > 100
          ? 64
          : item.length > 50
              ? 36
              : item.length > 36
                  ? 16
                  : 0;
      height += 60;
    }

    return height;
  }

  final _answerNotifier = ValueNotifier<int>(-1);

  @override
  Widget build(BuildContext context) {
    var _btnHeigth = 38.0;
    var _questions = QuizProvider().getQuizQuestions();
    _questions.shuffle();

    var _question = _questions.first;
    _question.answers.shuffle();

    return Padding(
      padding: hPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("lib/assets/farmer_speech/farmer-speech-quiz.png"),
            SizedBox(height: 24),
            Padding(
              padding: hPadding12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Вопрос",
                    style: textStyle(18, green40, FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 28),
                  Text(
                    _question.question,
                    style: textStyle(16, textColor),
                  )
                ],
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: _calcListViewHeigth(_question.answers),
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: _question.answers.length,
                itemBuilder: (BuildContext context, int i) =>
                    ValueListenableBuilder<int>(
                  valueListenable: _answerNotifier,
                  builder: (_, number, __) {
                    return Column(
                      children: [
                        number == i
                            // Выбрано
                            ? _question.answers[i].split(" ").length > 3
                                ? Column(
                                    children: [
                                      MaterialButton(
                                        minWidth:
                                            MediaQuery.of(context).size.width,
                                        height: _btnHeigth,
                                        color: blue60,
                                        onPressed: () =>
                                            _answerNotifier.value = i,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                "lib/assets/checkmark.svg"),
                                            SizedBox(width: 10),
                                            Text(
                                              _answerPresentView(
                                                      _question.answers[i])
                                                  .replaceAll(',', ''),
                                              style: textStyle(14, pureWhite,
                                                  FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                bntRadius)),
                                      ),
                                      Text(
                                          _question.answers[i].substring(
                                              _answerPresentView(
                                                          _question.answers[i])
                                                      .length +
                                                  1),
                                          style: textStyle(14)),
                                    ],
                                  )
                                : MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    height: _btnHeigth,
                                    color: blue60,
                                    onPressed: () => _answerNotifier.value = i,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            "lib/assets/checkmark.svg"),
                                        SizedBox(width: 10),
                                        Text(
                                          _question.answers[i],
                                          style: textStyle(
                                              14, pureWhite, FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(bntRadius)),
                                  )
                            // Не выбрано
                            : _question.answers[i].split(" ").length > 3
                                ? Column(
                                    children: [
                                      MaterialButton(
                                        minWidth:
                                            MediaQuery.of(context).size.width,
                                        height: _btnHeigth,
                                        onPressed: () =>
                                            _answerNotifier.value = i,
                                        child: Text(
                                          _answerPresentView(
                                                  _question.answers[i])
                                              .replaceAll(',', ''),
                                          style: textStyle(
                                              14, grey70, FontWeight.w500),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                bntRadius),
                                            side: BorderSide(color: grey70)),
                                      ),
                                      Text(
                                        _question.answers[i].substring(
                                            _answerPresentView(
                                                        _question.answers[i])
                                                    .length +
                                                1),
                                        style: textStyle(14, textColor),
                                      ),
                                    ],
                                  )
                                : MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    height: _btnHeigth,
                                    onPressed: () => _answerNotifier.value = i,
                                    child: Text(
                                      _question.answers[i],
                                      style: textStyle(
                                          14, grey70, FontWeight.w500),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(bntRadius),
                                        side: BorderSide(color: grey70)),
                                  ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              height: 38,
              color: green40,
              onPressed: () {
                var val = _answerNotifier.value;
                if (_question.trueAnswer.any(
                    (element) => element.answer == _question.answers[val])) {
                  waterNotifier.value = (waterNotifier.value * 1.1).round();
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: QuizCorrectScreen(
                              question: _question,
                              answerIndex: val,
                            ),
                          ));
                } else {
                  print(_question.question);
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: QuizWrongScreen(
                              question: _question,
                              answerIndex: val,
                            ),
                          ));
                }
              },
              child: Text(
                "Ответить",
                style: textStyle(14, pureWhite),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(bntRadius)),
            )
          ],
        ),
      ),
    );
  }
}

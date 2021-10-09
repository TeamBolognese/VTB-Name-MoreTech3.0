import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/profile/components/quiz_correct_screen.dart';
import 'package:moretech_app/profile/components/quiz_wrong_screen.dart';

class QuizTheoryScreen extends StatelessWidget {
  QuizTheoryScreen({Key? key, required this.waterNotifier}) : super(key: key);

  final ValueNotifier<int> waterNotifier;

  /*
  final _answers = [
    "Набор активов, собранных таким образом, чтобы доход от них соответствовал определенным целям инвестораортфель с бумагами, который хранится под матрасом",
    "Портфель с бумагами, который хранится под матрасом",
    "Пирамида это все!"
  ];
  */

  final _answers = [
    "Вариант 1",
    "Вариант 2",
  ];
  final _answerNotifier = ValueNotifier<int>(-1);

  @override
  Widget build(BuildContext context) {
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
                    "Что такое инвестиционный портфель?",
                    style: textStyle(16, textColor),
                  )
                ],
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: _answers.length,
                itemBuilder: (BuildContext context, int i) =>
                    ValueListenableBuilder<int>(
                  valueListenable: _answerNotifier,
                  builder: (_, number, __) {
                    return Column(
                      children: [
                        number == i
                            ? MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                height: 44,
                                color: blue60,
                                onPressed: () => _answerNotifier.value = i,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        "lib/assets/checkmark.svg"),
                                    SizedBox(width: 10),
                                    Text(
                                      _answers[i],
                                      style: textStyle(
                                          14, pureWhite, FontWeight.w500),
                                    )
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(bntRadius)),
                              )
                            : MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                height: 44,
                                onPressed: () => _answerNotifier.value = i,
                                child: Text(
                                  _answers[i],
                                  style: textStyle(14, grey70, FontWeight.w500),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(bntRadius),
                                    side: BorderSide(color: grey70)),
                              ),
                        SizedBox(height: 8),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 42),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              height: 38,
              color: green40,
              onPressed: () {
                var val = _answerNotifier.value;
                if (val == 0) {
                  waterNotifier.value = (waterNotifier.value * 1.1).round();
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: QuizCorrectScreen(),
                          ));
                } else if (val == 1) {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: QuizWrongScreen(),
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

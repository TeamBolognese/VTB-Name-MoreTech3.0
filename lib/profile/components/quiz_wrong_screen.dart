import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';

class QuizWrongScreen extends StatelessWidget {
  QuizWrongScreen({Key? key}) : super(key: key);

  final _answers = ["Вариант 1", "Вариант 2"];
  final _answerNotifier = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hPadding,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Image.asset(
                "lib/assets/farmer_speech/farmer-speech-wrong-answer.png"),
            SizedBox(height: 24),
            Padding(
              padding: hPadding12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Не верно",
                    style: textStyle(18, Colors.red, FontWeight.w500),
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
                                color: Colors.red,
                                onPressed: () {},
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
                                onPressed: () {},
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
            Text(
              "Пояснение:",
              style: textStyle(16, textColor, FontWeight.w500),
            ),
            SizedBox(height: 16),
            Text(
              kQuizExplanation,
              style: textStyle(16, textColor),
            ),
            SizedBox(height: 42),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              height: 38,
              color: green40,
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Перейти в профиль",
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/profile/components/quiz/components/quiz_question_model.dart';

class QuizWrongScreen extends StatelessWidget {
  QuizWrongScreen({Key? key, required this.question, required this.answerIndex})
      : super(key: key);

  final QuizQuestion question;
  final int answerIndex;

  final _answerNotifier = ValueNotifier<int>(0);

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

  @override
  Widget build(BuildContext context) {
    _answerNotifier.value = answerIndex;
    var _btnHeigth = 38.0;

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
                    "Верно",
                    style: textStyle(18, Colors.red, FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 28),
                  Text(
                    question.question,
                    style: textStyle(16, textColor),
                  )
                ],
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: _calcListViewHeigth(question.answers),
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: question.answers.length,
                itemBuilder: (BuildContext context, int i) =>
                    ValueListenableBuilder<int>(
                  valueListenable: _answerNotifier,
                  builder: (_, number, __) {
                    return Column(
                      children: [
                        number == i
                            // Выбрано
                            ? question.answers[i].split(" ").length > 3
                                ? Column(
                                    children: [
                                      MaterialButton(
                                        minWidth:
                                            MediaQuery.of(context).size.width,
                                        height: _btnHeigth,
                                        color: Colors.red,
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
                                                      question.answers[i])
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
                                          question.answers[i].substring(
                                              _answerPresentView(
                                                          question.answers[i])
                                                      .length +
                                                  1),
                                          style: textStyle(14)),
                                    ],
                                  )
                                : MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    height: _btnHeigth,
                                    color: Colors.red,
                                    onPressed: () => _answerNotifier.value = i,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            "lib/assets/checkmark.svg"),
                                        SizedBox(width: 10),
                                        Text(
                                          question.answers[i],
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
                            : question.answers[i].split(" ").length > 3
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
                                                  question.answers[i])
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
                                        question.answers[i].substring(
                                            _answerPresentView(
                                                        question.answers[i])
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
                                      question.answers[i],
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
            SizedBox(height: 42),
            Text(
              "Пояснение:",
              style: textStyle(16, textColor, FontWeight.w500),
            ),
            SizedBox(height: 16),
            Text(
              question.exp(),
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

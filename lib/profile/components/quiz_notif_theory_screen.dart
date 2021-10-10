import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/profile/components/components/quiz_provider.dart';
import 'package:moretech_app/profile/components/components/quiz_up_models.dart';
import 'package:moretech_app/profile/components/components/result_model.dart';
import 'package:moretech_app/profile/components/risk_screen.dart';
import 'package:moretech_app/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizNotifTheoryScreen extends StatelessWidget {
  QuizNotifTheoryScreen(
      {Key? key,
      required this.waterNotifier,
      required this.careNotifier,
      required this.sunNotifier})
      : super(key: key);

  final ValueNotifier<int> waterNotifier;
  final ValueNotifier<int> careNotifier;
  final ValueNotifier<int> sunNotifier;

  double _calcListViewHeigth(List<QuizUpAnswer> answers) {
    var height = 0.0;

    for (var item in answers) {
      height += item.subtitle.length > 100
          ? 64
          : item.subtitle.length > 50
              ? 36
              : item.subtitle.length > 36
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
    var _questions = QuizProvider().getSecondQuestionsPack();

    var _question = _questions.first;

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
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Column(
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
                                            _question.answers[i].title,
                                            style: textStyle(
                                                14, pureWhite, FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(bntRadius)),
                                    ),
                                    Text(_question.answers[i].subtitle,
                                        style: textStyle(14)),
                                  ],
                                ),
                              )
                            // Не выбрано
                            : Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Column(
                                  children: [
                                    MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      height: _btnHeigth,
                                      onPressed: () =>
                                          _answerNotifier.value = i,
                                      child: Text(
                                        _question.answers[i].title,
                                        style: textStyle(
                                            14, textColor, FontWeight.w500),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(bntRadius),
                                          side: BorderSide(color: grey70)),
                                    ),
                                    Text(_question.answers[i].subtitle,
                                        style: textStyle(14)),
                                  ],
                                ),
                              )
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
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                var str = prefs.getString("user");
                var user = User.fromRawJson(str!);

                var val = _answerNotifier.value;
                var rng = Random();
                var anw = _question.answers.firstWhere(
                    (element) => element.title == _question.answers[val].title);

                var coef = anw.fail == 0 ? 0 : (1 / anw.fail).round();
                var num = coef == 0 ? 0 : rng.nextInt(coef);

                var sun = user.flower!.sun!;
                if (num == 0) {
                  sun = (sun * anw.award).round();

                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: RiskScreen(
                              result: Result(
                                  property: ProteryType.sun,
                                  comment: _question.answers[val].comment,
                                  correct: true,
                                  changes: (anw.award - 1) * 100),
                              waterNotifier: waterNotifier,
                              careNotifier: careNotifier,
                              sunNotifier: sunNotifier,
                            ),
                          ));
                } else {
                  sun = (sun * (1 - anw.loss)).round();
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: RiskScreen(
                              result: Result(
                                  property: ProteryType.sun,
                                  comment: _question.answers[val].comment,
                                  correct: false,
                                  changes: anw.loss * 100),
                              waterNotifier: waterNotifier,
                              careNotifier: careNotifier,
                              sunNotifier: sunNotifier,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/survey/components/question_model.dart';
import 'package:moretech_app/survey/survey_complete_screen.dart';
import 'package:moretech_app/user_repository.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SurveyQuestionsScreen extends StatelessWidget {
  SurveyQuestionsScreen({Key? key}) : super(key: key);

  final List<Question> _questions = [
    Question(
      number: 1,
      question: "Как Вас зовут?",
      inputAnswer: true,
    ),
    Question(
      number: 2,
      question: "Ваш пол?",
      inputAnswer: false,
      answers: ["Мужской", "Женский"],
    ),
    Question(
      number: 3,
      question: "Сколько Вам лет?",
      inputAnswer: false,
      answers: ["До 25", "От 26 до 55", "Старше 56"],
    ),
    Question(
      number: 4,
      question: "Готовы ли Вы на безумные поступки для потенциальной выгоды?",
      inputAnswer: false,
      answers: ["Да", "Не уверен", "Нет"],
    ),
    Question(
      number: 5,
      question: "Чего Вы хотите?",
      inputAnswer: false,
      answers: ["Всего и сразу", "Как пойдет", "Не важно, главное не хуже"],
    ),
  ];

  void _showSurveyCompletePage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SurveyCompleteScreen()));
  }

  @override
  Widget build(BuildContext context) {
    var _questionNotifier = ValueNotifier<Question>(_questions.first);
    final _answerNotifier = ValueNotifier<int>(-1);

    final _width = MediaQuery.of(context).size.width;
    const _height = 38.0;
    final _nameController = TextEditingController(text: "Нео");
    return Scaffold(
      backgroundColor: pureWhite,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: ValueListenableBuilder<Question>(
          valueListenable: _questionNotifier,
          builder: (_, obj, __) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: pureWhite,
                  elevation: 0,
                  title: Text("Вопрос ${obj.number}", style: textStyle()),
                  centerTitle: true,
                  leading: obj.number == 1
                      ? Icon(Icons.arrow_back_outlined, size: 0)
                      : IconButton(
                          icon: Icon(
                            Icons.arrow_back_outlined,
                            size: 24,
                            color: blue60,
                          ),
                          onPressed: () {
                            var v = _questions.indexOf(obj);
                            var q = _questions[v - 1];
                            _questionNotifier.value = q;
                            _answerNotifier.value =
                                q.answers!.indexOf(q.userAnswer!);
                          },
                        ),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: hPadding,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "lib/assets/farmer_speech/farmer-speech-indaphrase.png",
                        width: 233,
                        height: 232,
                      ),
                      SizedBox(height: 48),
                      Padding(
                        padding: hPadding12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Вопрос ${obj.number}.",
                              style: textStyle(18, textColor, FontWeight.w500),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 8),
                            Text(
                              obj.question,
                              style: textStyle(16, textColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 28),
                      obj.inputAnswer
                          ? SizedBox(
                              width: _width * 0.65,
                              height: _height,
                              child: TextFormField(
                                controller: _nameController,
                                cursorColor: blue60,
                                obscureText: false,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                    hintText: "Имя",
                                    hintStyle: textStyle(16, grey40),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: grey40)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: grey70))),
                              ),
                            )
                          : SizedBox(
                              width: _width,
                              height: obj.answers!.length > 2
                                  ? _height * 5
                                  : _height * 3.5,
                              child: ListView.builder(
                                itemCount: obj.answers!.length,
                                itemBuilder: (context, i) =>
                                    ValueListenableBuilder<int>(
                                  valueListenable: _answerNotifier,
                                  builder: (_, number, __) {
                                    return Column(
                                      children: [
                                        number == i
                                            ? MaterialButton(
                                                minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 44,
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
                                                      obj.answers![i],
                                                      style: textStyle(
                                                          14,
                                                          pureWhite,
                                                          FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            bntRadius)),
                                              )
                                            : MaterialButton(
                                                minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 44,
                                                onPressed: () =>
                                                    _answerNotifier.value = i,
                                                child: Text(
                                                  obj.answers![i],
                                                  style: textStyle(14, grey70,
                                                      FontWeight.w500),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            bntRadius),
                                                    side: BorderSide(
                                                        color: grey70)),
                                              ),
                                        SizedBox(height: 8),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                      SizedBox(height: 28),
                      Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: obj.number - 1,
                          count: _questions.length,
                          effect: WormEffect(
                            dotWidth: 8,
                            dotHeight: 8,
                            activeDotColor: blue60,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 38,
                        color: green40,
                        onPressed: () async {
                          if (_answerNotifier.value == -1 && obj.number != 1) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.redAccent,
                              content:
                                  Text("Выберите один из вариантов ответа"),
                            ));
                            return;
                          }

                          if (obj.number == 1) {
                            obj.userAnswer = _nameController.text;
                          } else {
                            obj.userAnswer =
                                obj.answers![_answerNotifier.value];
                          }

                          if (_questions.last.number == obj.number) {
                            _showSurveyCompletePage(context);
                            var user = {
                              "name": _questions[0].userAnswer,
                              "sex": _questions[1].userAnswer,
                              "age": _questions[2].userAnswer,
                              "crazy_status": _questions[3].userAnswer,
                              "target": _questions[4].userAnswer,
                              "balance": 0,
                              "water": 0,
                              "heart": 0,
                              "sun": 0,
                            };

                            UserRepository().saveUser(user);
                          } else {
                            var v = _questions.indexOf(obj);
                            _questionNotifier.value = _questions[v + 1];
                          }

                          _answerNotifier.value = -1;
                        },
                        child: Text(
                          "Далее",
                          style: textStyle(14, pureWhite),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(bntRadius)),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/survey/survey_complete_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SurveyQuestionsScreen extends StatelessWidget {
  SurveyQuestionsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _questions = [
    {
      "title": "Вопрос 1.",
      "content": "Длинное описание вопроса \nДлинное описание вопроса",
      "answers": ["Вариант 1", "Вариант 2"]
    },
    {
      "title": "Вопрос 2.",
      "content": "Длинное описание вопроса 2 \nДлинное описание вопроса 2",
      "answers": ["Вариант 1", "Вариант 2"]
    },
    {
      "title": "Вопрос 3.",
      "content": "Длинное описание вопроса 3 \nДлинное описание вопроса 3",
      "answers": ["Вариант 1", "Вариант 2"]
    },
  ];

  void _showSurveyCompletePage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SurveyCompleteScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: AppBar(
              backgroundColor: pureWhite,
              elevation: 0,
              title: Text("Вопрос 1", style: textStyle()),
              centerTitle: true,
              leading: Icon(
                Icons.arrow_back_outlined,
                size: 24,
                color: blue60,
              ),
            ),
          ),
          SizedBox(height: 48),
          Padding(
            padding: hPadding,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "lib/assets/farmer/gardener-cleaning-garden.png",
                    width: 184,
                    height: 180,
                  ),
                  SizedBox(height: 48),
                  Padding(
                    padding: hPadding12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Вопрос 1.",
                          style: textStyle(18, textColor, FontWeight.w500),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Длинное описание вопроса \nДлинное описание вопроса",
                          style: textStyle(16, textColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 76),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 44,
                    color: green40,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("lib/assets/checkmark.svg"),
                        SizedBox(width: 10),
                        Text(
                          "Вариант 1",
                          style: textStyle(14, pureWhite, FontWeight.w500),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(bntRadius)),
                  ),
                  SizedBox(height: 16),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 44,
                    onPressed: () {},
                    child: Text(
                      "Вариант 2",
                      style: textStyle(14, grey70, FontWeight.w500),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(bntRadius),
                        side: BorderSide(color: grey70)),
                  ),
                  SizedBox(height: 52),
                  Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: 0,
                      count: 2,
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
                    color: blue60,
                    onPressed: () => _showSurveyCompletePage(context),
                    child: Text(
                      "Далее",
                      style: textStyle(14, pureWhite),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(bntRadius)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

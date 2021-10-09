import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/survey/survey_questions_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key, required this.login}) : super(key: key);

  final String login;

  void _showSurveyPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SurveyQuestionsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: hPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/assets/farmer/indian-gardener-standing-in-welcome-pose.png",
                width: 225,
                height: 310,
              ),
              SizedBox(height: 32),
              Text(
                "Привет, $login!",
                style: textStyle(18, textColor, FontWeight.w500),
              ),
              SizedBox(height: 16),
              Text(
                kRadzheb,
                style: textStyle(16, textColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 54),
              Text(
                "Давай для начала познакомимся:",
                style: textStyle(16, textColor, FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                height: 44,
                color: green40,
                onPressed: () => _showSurveyPage(context),
                child: Text(
                  "Перейти к знакомству",
                  style: textStyle(14, pureWhite, FontWeight.w500),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(bntRadius)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

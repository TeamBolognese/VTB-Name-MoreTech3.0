import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/survey/survey_prize_screen.dart';

class SurveyCompleteScreen extends StatelessWidget {
  const SurveyCompleteScreen({Key? key}) : super(key: key);

  void _showSurveyPrizePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SurveyPrizeScreen()));
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
                "lib/assets/farmer/gardener-holding-pot.png",
                width: 241,
                height: 194,
              ),
              SizedBox(height: 14),
              Text("Ты молодец!",
                  style: textStyle(18, textColor, FontWeight.w500)),
              SizedBox(height: 10),
              Padding(
                padding: hPadding12,
                child: Text(kSurveyComplete, style: textStyle(16, textColor)),
              ),
              SizedBox(height: 52),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                height: 44,
                color: green40,
                onPressed: () => _showSurveyPrizePage(context),
                child: Text(
                  "Забрать подарок!",
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

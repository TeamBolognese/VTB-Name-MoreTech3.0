import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/survey/survey_prize_screen.dart';
import 'package:moretech_app/user_repository.dart';

class SurveyCompleteScreen extends StatelessWidget {
  const SurveyCompleteScreen({Key? key}) : super(key: key);

  Future<void> _showSurveyPrizePage(BuildContext context) async {
    var old = await UserRepository().getUserData();
    var user = await UserRepository().createUser(old!.toJson());
    await UserRepository().saveUser(user.toJson());

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SurveyPrizeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: Padding(
        padding: hPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/assets/farmer_speech/farmer-speech-welldone.png",
              width: 241,
              height: 250,
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
    );
  }
}

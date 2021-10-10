import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/profile/components/award_fail_screen%20copy.dart';
import 'package:moretech_app/profile/components/award_success_screen.dart';
import 'package:moretech_app/profile/components/components/result_model.dart';
import 'package:moretech_app/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiskScreen extends StatelessWidget {
  const RiskScreen(
      {Key? key,
      required this.result,
      required this.waterNotifier,
      required this.careNotifier,
      required this.sunNotifier})
      : super(key: key);

  final Result result;
  final ValueNotifier<int> waterNotifier;
  final ValueNotifier<int> careNotifier;
  final ValueNotifier<int> sunNotifier;

  @override
  Widget build(BuildContext context) {
    print("result -> ${result.correct}");
    return Padding(
      padding: hPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
                "lib/assets/farmer_speech/farmer-speech-risk-answer.png"),
            SizedBox(height: 24),
            Text(
              result.comment,
              style: textStyle(16, textColor),
            ),
            SizedBox(height: 42),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              height: 38,
              color: green40,
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                var str = prefs.getString("user");
                var user = User.fromRawJson(str!);

                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: result.correct
                              ? AwardSuccessScreen(
                                  result: result,
                                  user: user,
                                  waterNotifier: waterNotifier,
                                  careNotifier: careNotifier,
                                  sunNotifier: sunNotifier,
                                )
                              : AwardFailScreen(
                                  result: result,
                                  user: user,
                                  waterNotifier: waterNotifier,
                                  careNotifier: careNotifier,
                                  sunNotifier: sunNotifier,
                                ),
                        ));
              },
              child: Text(
                "Узнать результат",
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

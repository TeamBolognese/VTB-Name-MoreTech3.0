import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/profile/components/quiz_notif_theory_screen.dart';

class HintScreen extends StatelessWidget {
  const HintScreen(
      {Key? key,
      required this.waterNotifier,
      required this.careNotifier,
      required this.sunNotifier})
      : super(key: key);

  final ValueNotifier<int> waterNotifier;
  final ValueNotifier<int> careNotifier;
  final ValueNotifier<int> sunNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("lib/assets/farmer_speech/farmer-speech-threat.png"),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Внимание",
                  style: textStyle(18, Colors.red, FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  "Нужно заняться цветком",
                  style: textStyle(14, textColor, FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 28),
                Text(
                  "Настало время позаботиться о твоём цветке. У меня есть для тебя предложение, нужно услышать твоё мнение...",
                  style: textStyle(16, textColor),
                )
              ],
            ),
            SizedBox(height: 42),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              height: 38,
              color: green40,
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: QuizNotifTheoryScreen(
                            waterNotifier: waterNotifier,
                            careNotifier: careNotifier,
                            sunNotifier: sunNotifier,
                          ),
                        ));
              },
              child: Text(
                "Перейти к действиям!",
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

import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';

class HintScreen extends StatelessWidget {
  const HintScreen({Key? key}) : super(key: key);

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
                  "Угроза",
                  style: textStyle(18, Colors.red, FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  "сорняки",
                  style: textStyle(14, textColor, FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 28),
                Text(
                  "Небольшое описание, почему сорняки вредны, пояснение на языке инвестиций, а также способы борьбы с сорняками (в мире инвестиций - и как мы это сделаем метафорически в самой игре)",
                  style: textStyle(16, textColor),
                )
              ],
            ),
            SizedBox(height: 42),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              height: 38,
              color: green40,
              onPressed: () {},
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

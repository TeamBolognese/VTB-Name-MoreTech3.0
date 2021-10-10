import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/profile/components/components/result_model.dart';
import 'package:moretech_app/user_model.dart';

class AwardFailScreen extends StatelessWidget {
  const AwardFailScreen(
      {Key? key,
      required this.result,
      required this.user,
      required this.waterNotifier,
      required this.careNotifier,
      required this.sunNotifier})
      : super(key: key);

  final Result result;
  final User user;
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
            SvgPicture.asset(
                "lib/assets/plants/${user.flowerEnglishName()}/${user.flowerEnglishName()}-S-high-health.svg"),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                result.correct
                    ? Text(
                        "Задание выполнено",
                        style: textStyle(18, Colors.red, FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                    : Text(
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/profile/components/components/result_model.dart';
import 'package:moretech_app/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AwardSuccessScreen extends StatelessWidget {
  const AwardSuccessScreen(
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
    final ValueNotifier<int> copySunNotifier =
        ValueNotifier<int>(sunNotifier.value);
    sunNotifier.value += result.changes.round();

    return Padding(
      padding: hPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
                "lib/assets/plants/${user.flowerEnglishName()}/${user.flowerEnglishName()}-S-high-health.svg"),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Задание выполнено!",
                  style: textStyle(18, green40, FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Text(
                  "награда:",
                  style: textStyle(14, blue40, FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/icons/ico_ sun40.png",
                      width: 64,
                    ),
                    SizedBox(width: 6),
                    Text(" + ${result.changes.round()} к свету",
                        style: textStyle(24, textColor, FontWeight.w500))
                  ],
                ),
                SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/icons/ico_ sun40.png",
                      width: 24,
                    ),
                    SizedBox(width: 6),
                    Text("${copySunNotifier.value}",
                        style: textStyle(14, textColor, FontWeight.w500)),
                    SizedBox(width: 6),
                    Text(">", style: textStyle(14, textColor, FontWeight.w500)),
                    SizedBox(width: 6),
                    Image.asset(
                      "lib/assets/icons/ico_ sun40.png",
                      width: 24,
                    ),
                    SizedBox(width: 6),
                    Text("${sunNotifier.value}",
                        style: textStyle(14, textColor, FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 16),
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Container(
                      width: 150,
                      height: 4,
                      color: grey40.withOpacity(0.75),
                    ),
                    Container(
                      width: 120,
                      height: 4,
                      color: Colors.green,
                    ),
                    Container(
                      width: 90,
                      height: 4,
                      color: green40,
                    ),
                  ],
                ),
              ],
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

                var water = waterNotifier.value +
                    (1 / -(copySunNotifier.value - sunNotifier.value)).round();

                var hp_up = (100 * (careNotifier.value + water)) / (60 * 14);

                var hp_down = (100 * (careNotifier.value + water)) / (60 * 39);

                var hp = hp_up > 100 ? hp_up - 100 : hp_up;

                user.flower!.sun = sunNotifier.value;
                user.flower!.water = water;
                waterNotifier.value = water;
                await prefs.setString("hp", hp.toString());
                await prefs.setString("user", jsonEncode(user));

                Navigator.pop(context);
              },
              child: Text(
                "Перейти в профиль",
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

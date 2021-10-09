import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';

class SurveyPlantDescriptionScreen extends StatelessWidget {
  const SurveyPlantDescriptionScreen({Key? key}) : super(key: key);

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
              leading: Icon(
                Icons.arrow_back_outlined,
                size: 24,
                color: blue60,
              ),
            ),
          ),
          SizedBox(height: 48),
          Padding(
            padding: hPadding28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  "lib/assets/plant.svg",
                  width: 70,
                  height: 80,
                ),
                SizedBox(height: 20),
                Text(
                  "Ромашка",
                  style: textStyle(18, textColor, FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                Text("Выбор растения по результатам тестирования.",
                    style: textStyle(16, textColor)),
                SizedBox(height: 24),
                Text(
                  "Объяснение",
                  style: textStyle(16, textColor, FontWeight.w700),
                ),
                Text(
                    "- почему именно данное растение (т.е. данный тип) \n-на чем основана сегментация, \n-что для пользователя это значит",
                    style: textStyle(16, textColor)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

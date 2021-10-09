import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/navigation_bar/navigation_bar_screen.dart';
import 'package:moretech_app/survey/survey_plant_description_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveyPrizeScreen extends StatelessWidget {
  const SurveyPrizeScreen({Key? key}) : super(key: key);

  void _showSurveyPrizeDescriptionPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SurveyPlantDescriptionScreen()));
  }

  void _showMainMenuPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NavigationBarScreen()));
  }

  Future<String> _getUser() async {
    var prefs = await SharedPreferences.getInstance();
    var user = jsonDecode(prefs.getString("user")!);
    var count = double.parse(user["count"]);
    var name = count >= 2.8
        ? "Роза"
        : count >= 2.3
            ? "Тюльпан"
            : "Ромашка";
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: hPadding,
        child: Center(
          child: FutureBuilder<String>(
            future: _getUser(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                var name = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "lib/assets/plant.svg",
                      width: 160,
                      height: 175,
                    ),
                    SizedBox(height: 24),
                    Stack(
                      children: [
                        SizedBox(
                          width: 135,
                          height: 40,
                          child: Center(
                            child: Text(name!,
                                style:
                                    textStyle(18, textColor, FontWeight.w500)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Positioned(
                          left: 110,
                          bottom: 20,
                          child: GestureDetector(
                            onTap: () =>
                                _showSurveyPrizeDescriptionPage(context),
                            child: SvgPicture.asset("lib/assets/question.svg"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: hPadding12,
                      child: Text(
                        kSurveyPrize,
                        style: textStyle(16, textColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 52),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 44,
                      color: green40,
                      onPressed: () => _showMainMenuPage(context),
                      child: Text(
                        "Забрать подарок!",
                        style: textStyle(14, pureWhite, FontWeight.w500),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(bntRadius)),
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 38,
                      onPressed: () {},
                      child: Text(
                        "Выбрать другое растение",
                        style: textStyle(14, blue60),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(bntRadius)),
                    ),
                  ],
                );
              }
              return Text("Что-то пошло не так! ${snapshot.data}");
            },
          ),
        ),
      ),
    );
  }
}

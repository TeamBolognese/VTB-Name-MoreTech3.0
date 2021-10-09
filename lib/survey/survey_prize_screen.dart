import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/navigation_bar/navigation_bar_screen.dart';
import 'package:moretech_app/survey/survey_plant_description_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: hPadding,
        child: Center(
          child: Column(
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
                      child: Text("Ромашка",
                          style: textStyle(18, textColor, FontWeight.w500)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Positioned(
                    left: 110,
                    bottom: 20,
                    child: GestureDetector(
                      onTap: () => _showSurveyPrizeDescriptionPage(context),
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
          ),
        ),
      ),
    );
  }
}

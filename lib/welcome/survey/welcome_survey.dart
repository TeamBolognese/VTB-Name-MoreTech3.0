import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';

class WelcomeSurvey extends StatelessWidget {
  const WelcomeSurvey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: hPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "lib/assets/farmer/gardener-cleaning-garden.png",
                width: 184,
                height: 180,
              ),
              SizedBox(height: 48),
              Padding(
                padding: hPadding12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Вопрос 1.",
                      style: textStyle(18, textColor, FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Длинное описание вопроса \nДлинное описание вопроса",
                      style: textStyle(16, textColor),
                    )
                  ],
                ),
              ),
              SizedBox(height: 76),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                height: 44,
                color: green40,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("lib/assets/checkmark.svg"),
                    SizedBox(width: 10),
                    Text(
                      "Вариант 1",
                      style: textStyle(14, pureWhite, FontWeight.w500),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(bntRadius)),
              ),
              SizedBox(height: 16),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                height: 44,
                onPressed: () {},
                child: Text(
                  "Вариант 2",
                  style: textStyle(14, grey70, FontWeight.w500),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(bntRadius),
                    side: BorderSide(color: grey70)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

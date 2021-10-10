import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/user_model.dart';
import 'package:moretech_app/user_repository.dart';

class SurveyPlantDescriptionScreen extends StatelessWidget {
  const SurveyPlantDescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: FutureBuilder<User?>(
        future: UserRepository().getUserData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print("Survey prize screen fail");
            return Text("Что-то пошло не так! ${snapshot.data}");
          }

          var user = snapshot.data!;
          var flower = user.flower!;
          var name = flower.name;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: AppBar(
                  backgroundColor: pureWhite,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      size: 24,
                      color: blue60,
                    ),
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
                      "lib/assets/plants/${flower.defaultPath()}",
                      width: 70,
                      height: 80,
                    ),
                    SizedBox(height: 20),
                    Text(
                      name,
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
          );
        },
      ),
    );
  }
}

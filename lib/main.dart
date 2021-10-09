import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/welcome/survey/welcome_survey_plant_description.dart';
import 'package:moretech_app/welcome/survey/welcome_survey_plant_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: pureWhite),
      debugShowCheckedModeBanner: false,
      home: WelcomeSurveyPlantStore(),
    );
  }
}

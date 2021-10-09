import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Главная",
          style: textStyle(24, textColor, FontWeight.w700),
        ),
      ),
    );
  }
}

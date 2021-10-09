import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Профиль",
          style: textStyle(24, textColor, FontWeight.w700),
        ),
      ),
    );
  }
}

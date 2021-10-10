import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: Center(
        child: Text(
          "Прочее",
          style: textStyle(24, textColor, FontWeight.w700),
        ),
      ),
    );
  }
}

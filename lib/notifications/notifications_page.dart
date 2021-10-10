import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: Center(
        child: Text(
          "Уведомления",
          style: textStyle(24, textColor, FontWeight.w700),
        ),
      ),
    );
  }
}

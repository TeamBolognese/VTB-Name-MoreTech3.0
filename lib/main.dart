import 'package:flutter/material.dart';
import 'package:moretech_app/auth/screens/login_login_screen.dart';
import 'package:moretech_app/constants.dart';

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
      home: LoginLoginScreen(),
    );
  }
}

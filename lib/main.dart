import 'package:flutter/material.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/navigation_bar/navigation_bar_screen.dart';
import 'package:moretech_app/user_repository.dart';
import 'package:moretech_app/welcome/welcome_screen.dart';

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
      home: FutureBuilder<bool>(
        future: UserRepository().userExist(),
        builder: (context, snapshot) => snapshot.hasData && snapshot.data!
            ? NavigationBarScreen()
            : WelcomeScreen(),
      ),
    );
  }
}

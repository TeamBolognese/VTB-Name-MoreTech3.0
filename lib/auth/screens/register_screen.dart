import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/auth/screens/login_login_screen.dart';
import 'package:moretech_app/auth/screens/login_password_screen.dart';
import 'package:moretech_app/constants.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  void _showPasswordPage(BuildContext context) {
    final _login = _loginController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPasswordScreen(
                  login: _login,
                )));
  }

  void _showLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginLoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    const _height = 38.0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(logoPath),
              const SizedBox(height: 64),
              SizedBox(
                width: _width,
                height: _height,
                child: TextFormField(
                  controller: _loginController,
                  cursorColor: blue60,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "Логин",
                      hintStyle: textStyle(16, grey40),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: grey40)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: grey70))),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: _width,
                height: _height,
                child: TextFormField(
                  controller: _passwordController,
                  cursorColor: blue60,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "Пароль",
                      hintStyle: textStyle(16, grey40),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: grey40)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: grey70))),
                ),
              ),
              const SizedBox(height: 64),
              MaterialButton(
                minWidth: _width,
                height: _height,
                color: blue60,
                onPressed: () => _showPasswordPage(context),
                child: Text(
                  "Зарегистрироваться",
                  style: textStyle(14, pureWhite),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(bntRadius)),
              ),
              MaterialButton(
                minWidth: _width,
                height: _height,
                onPressed: () => _showLoginPage(context),
                child: Text(
                  "Вход",
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

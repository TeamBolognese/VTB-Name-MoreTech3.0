import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/auth/screens/register_screen.dart';
import 'package:moretech_app/constants.dart';

class LoginPasswordScreen extends StatelessWidget {
  const LoginPasswordScreen({Key? key, required this.login}) : super(key: key);

  final String login;

  void _showRegisterPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterScreen()));
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
              Text(
                login,
                style: textStyle(14, grey90, FontWeight.bold),
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: _width,
                height: _height,
                child: TextFormField(
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
              const SizedBox(height: 36),
              MaterialButton(
                minWidth: _width,
                height: _height,
                color: blue60,
                onPressed: () {},
                child: Text(
                  "Войти",
                  style: textStyle(14, pureWhite),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(bntRadius)),
              ),
              MaterialButton(
                minWidth: _width,
                height: _height,
                onPressed: () => _showRegisterPage(context),
                child: Text(
                  "Регистрация",
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

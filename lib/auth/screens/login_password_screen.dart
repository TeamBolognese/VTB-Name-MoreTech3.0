import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/auth/screens/register_screen.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/welcome/welcome_screen.dart';

class LoginPasswordScreen extends StatelessWidget {
  LoginPasswordScreen({Key? key, required this.login}) : super(key: key);

  final String login;
  final _passwordController = TextEditingController(text: "pa\$\$w0rd");
  final _obscureNotifier = ValueNotifier<bool>(true);

  void _showWelcomePage(BuildContext context) {}

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
        padding: hPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(logoPath),
              const SizedBox(height: 64),
              Text(
                "Ваш логин - $login",
                style: textStyle(14, grey90, FontWeight.bold),
              ),
              const SizedBox(height: 36),
              ValueListenableBuilder<bool>(
                valueListenable: _obscureNotifier,
                builder: (_, val, __) => SizedBox(
                  width: _width,
                  height: _height,
                  child: TextFormField(
                    cursorColor: blue60,
                    controller: _passwordController,
                    obscureText: val,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        hintText: "Пароль",
                        hintStyle: textStyle(16, grey40),
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              _obscureNotifier.value = !_obscureNotifier.value,
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: SvgPicture.asset(
                              "lib/assets/icons/ico_ eye.svg",
                              color: _obscureNotifier.value ? grey40 : blue60,
                            ),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey40)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey70))),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              MaterialButton(
                minWidth: _width,
                height: _height,
                color: blue60,
                onPressed: () => _showWelcomePage(context),
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

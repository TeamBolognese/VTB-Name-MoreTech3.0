import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/welcome/welcome_screen.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  final _nameController = TextEditingController(text: "Нео");

  void _showPasswordPage(BuildContext context) {
    final _name = _nameController.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WelcomeScreen(name: _name)));
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
              SizedBox(
                width: _width,
                height: _height,
                child: TextFormField(
                  controller: _nameController,
                  cursorColor: blue60,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "Имя",
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
                onPressed: () => _showPasswordPage(context),
                child: Text(
                  "Продолжить",
                  style: textStyle(14, pureWhite),
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

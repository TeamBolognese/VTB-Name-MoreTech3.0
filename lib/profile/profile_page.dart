import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/profile/components/custom_dialog.dart';
import 'package:moretech_app/profile/components/quiz_theory_screen.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  dynamic _showCustomDialog(BuildContext context, {Widget? child}) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: child,
            ));
  }

  final _waterNotifier = ValueNotifier(40);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _width3 = MediaQuery.of(context).size.width * 0.3;
    return Scaffold(
      backgroundColor: pureWhite,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: AppBar(
                backgroundColor: pureWhite,
                elevation: 0,
                title: Text("Профиль", style: textStyle()),
                centerTitle: true,
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: hPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("lib/assets/userlogo.svg"),
                  SizedBox(height: 24),
                  Text(
                    "Нео",
                    style: textStyle(18, textColor, FontWeight.w500),
                  ),
                  SizedBox(height: 48),
                  SizedBox(
                    width: _width,
                    height: 100,
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Мой баланс:",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: grey70,
                                  fontWeight: FontWeight.w500,
                                )),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "lib/assets/icons/ico_ seed.svg"),
                                    SizedBox(width: 12),
                                    Text("5 200",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          color: green40,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                                SvgPicture.asset(
                                  "lib/assets/icons/ico_ add_fill_24x24.svg",
                                  color: blue40,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: _width3,
                        height: 140,
                        child: GestureDetector(
                          onTap: () => _showCustomDialog(context,
                              child: QuizTheoryScreen(
                                waterNotifier: _waterNotifier,
                              )),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          "lib/assets/icons/ico_ water.jpg",
                                          width: 16),
                                      SizedBox(width: 6),
                                      Text("Вода",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            color: grey70,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  ValueListenableBuilder<int>(
                                    valueListenable: _waterNotifier,
                                    builder: (_, val, __) => RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: val.toString(),
                                              style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                color: blue40,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          TextSpan(
                                              text: " / 100",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                color: grey70,
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 18),
                                  SvgPicture.asset(
                                    "lib/assets/icons/ico_ add_fill_24x24.svg",
                                    color: blue40,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _width3,
                        height: 140,
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "lib/assets/icons/ico_ heart.jpg",
                                      width: 16,
                                    ),
                                    SizedBox(width: 6),
                                    Text("Забота",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: grey70,
                                          fontWeight: FontWeight.w500,
                                        ))
                                  ],
                                ),
                                SizedBox(height: 16),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "20",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      TextSpan(
                                          text: " / 100",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            color: grey70,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _width3,
                        height: 140,
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        "lib/assets/icons/ico_ sun.svg"),
                                    SizedBox(width: 6),
                                    Text("Свет",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: grey70,
                                          fontWeight: FontWeight.w500,
                                        ))
                                  ],
                                ),
                                SizedBox(height: 16),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "60",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            color: Colors.orangeAccent,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      TextSpan(
                                          text: " / 100",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            color: grey70,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 52),
                  Text("Папоротник",
                      style: textStyle(18, textColor, FontWeight.w500)),
                  SizedBox(height: 32),
                  SvgPicture.asset("lib/assets/img_fern_grown.svg"),
                  SizedBox(height: 24),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Размер: ",
                          style: textStyle(16, grey70, FontWeight.w700)),
                      TextSpan(text: "42 см", style: textStyle(16, grey70)),
                    ]),
                  ),
                  SizedBox(height: 12),
                  Text("+ 10 % / нед",
                      style: textStyle(16, green40, FontWeight.w500)),
                  SizedBox(height: 30),
                  SizedBox(
                    width: _width * 0.5,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text(
                                "Здоровье",
                                style: textStyle(14, grey70, FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: Text("90",
                                  style:
                                      textStyle(14, grey70, FontWeight.w500)),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 0,
                                  disabledThumbRadius: 0,
                                  elevation: 0)),
                          child: Slider(
                            min: 0,
                            max: 100,
                            value: 90,
                            activeColor: green40,
                            thumbColor: null,
                            mouseCursor: null,
                            onChanged: (double? value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 52),
                  SizedBox(
                    width: 200,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.5,
                      height: 44,
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.red,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "уведомления",
                            style: textStyle(16, Colors.red, FontWeight.w700),
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(bntRadius),
                          side: BorderSide(color: Colors.red, width: 2)),
                    ),
                  ),
                  SizedBox(height: 52),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

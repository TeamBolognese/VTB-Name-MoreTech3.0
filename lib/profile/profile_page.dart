import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';
import 'package:moretech_app/profile/components/hint_screen.dart';
import 'package:moretech_app/profile/components/quiz_theory_screen.dart';
import 'package:moretech_app/user_model.dart';
import 'package:moretech_app/user_repository.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  dynamic _showCustomDialog(BuildContext context, {Widget? child}) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: child,
            ));
  }

  final _waterNotifier = ValueNotifier(0);
  final _careNotifier = ValueNotifier(0);
  final _sunNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _width3 = MediaQuery.of(context).size.width * 0.3;
    return Scaffold(
      backgroundColor: pureWhite,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: FutureBuilder<User?>(
          future: UserRepository().getUserData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("Что-то пошло не так! ${snapshot.data}");
            }

            var user = snapshot.data;
            _waterNotifier.value = user!.flower!.water!;
            _careNotifier.value = user.flower!.care!;
            _sunNotifier.value = user.flower!.sun!;
            return Column(
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
                        user.name,
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
                                    style:
                                        textStyle(16, grey70, FontWeight.w500)),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "lib/assets/icons/ico_ seed.svg"),
                                        SizedBox(width: 12),
                                        Text("${user.balance}",
                                            style: textStyle(
                                                20, green40, FontWeight.w500)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              "lib/assets/icons/ico_ water.jpg",
                                              width: 16),
                                          SizedBox(width: 6),
                                          Text("Вода",
                                              style: textStyle(
                                                  16, grey70, FontWeight.w500))
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
                                                  style: textStyle(18, blue40,
                                                      FontWeight.w500)),
                                              TextSpan(
                                                  text: " / 100",
                                                  style: textStyle(12, grey70,
                                                      FontWeight.w700)),
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "lib/assets/icons/ico_ care.jpg",
                                          width: 16,
                                        ),
                                        SizedBox(width: 6),
                                        Text("Забота",
                                            style: textStyle(
                                                16, grey70, FontWeight.w500))
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    ValueListenableBuilder<int>(
                                      valueListenable: _careNotifier,
                                      builder: (_, val, __) => RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: val.toString(),
                                                style: textStyle(18, Colors.red,
                                                    FontWeight.w500)),
                                            TextSpan(
                                                text: " / 100",
                                                style: textStyle(12, grey70,
                                                    FontWeight.w700)),
                                          ],
                                        ),
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            "lib/assets/icons/ico_ sun.svg"),
                                        SizedBox(width: 6),
                                        Text("Свет",
                                            style: textStyle(
                                                16, grey70, FontWeight.w500))
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    ValueListenableBuilder<int>(
                                      valueListenable: _sunNotifier,
                                      builder: (_, val, __) => RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: val.toString(),
                                                style: textStyle(
                                                    18,
                                                    Colors.orangeAccent,
                                                    FontWeight.w500)),
                                            TextSpan(
                                                text: " / 100",
                                                style: textStyle(12, grey70,
                                                    FontWeight.w700)),
                                          ],
                                        ),
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
                      Text(user.flowerName(),
                          style: textStyle(18, textColor, FontWeight.w500)),
                      SizedBox(height: 32),
                      SvgPicture.asset(
                          "lib/assets/plants/${user.flowerEnglishName()}/${user.flowerEnglishName()}-S-high-health.svg"),
                      SizedBox(height: 30),
                      SizedBox(
                        width: _width * 0.55,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Text(
                                    "Здоровье",
                                    style:
                                        textStyle(14, grey70, FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 24),
                                  child: Text("90",
                                      style: textStyle(
                                          14, grey70, FontWeight.w500)),
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
                          onPressed: () => _showCustomDialog(context,
                              child: HintScreen(
                                waterNotifier: _waterNotifier,
                                careNotifier: _careNotifier,
                                sunNotifier: _sunNotifier,
                              )),
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
                                style:
                                    textStyle(16, Colors.red, FontWeight.w700),
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
            );
          },
        ),
      ),
    );
  }
}

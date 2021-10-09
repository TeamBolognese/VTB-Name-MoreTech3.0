import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moretech_app/constants.dart';

class SurveyPlantStoreScreen extends StatelessWidget {
  const SurveyPlantStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: AppBar(
              backgroundColor: pureWhite,
              elevation: 0,
              leading: Icon(
                Icons.arrow_back_outlined,
                size: 24,
                color: blue60,
              ),
            ),
          ),
          SizedBox(height: 16),
          Column(
            children: [
              Padding(
                padding: hPadding28,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Мой счет",
                      style: textStyle(24, textColor, FontWeight.w700),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "счет еще не открыт",
                      style: textStyle(16, textColor),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.info_outline_rounded,
                          color: blue40,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "для покупки растения необходим \nинвестиционный счет",
                          style: TextStyle(
                              fontSize: 14,
                              color: blue40,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: hPadding,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 38,
                  color: blue60,
                  onPressed: () {},
                  child: Text(
                    "Открыть счет",
                    style: textStyle(14, pureWhite),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(bntRadius)),
                ),
              ),
              SizedBox(height: 54),
              Padding(
                padding: hPadding28,
                child: Column(
                  children: [
                    Text(
                      "Магазин решений",
                      style: textStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36),
              Padding(
                padding: hPadding,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 44,
                  color: green40,
                  onPressed: () {},
                  child: Text(
                    "Купить",
                    style: textStyle(14, pureWhite, FontWeight.w500),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(bntRadius)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

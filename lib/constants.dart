import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const url = "https://vtbmt3.teambolognese.ru/api";
const logoPath = "lib/assets/logo.svg";

const lightBlue = Color(0xFF00AAFF);
const pureWhite = Color(0xFFFFFFFF);
const blue40 = Color(0xFF6FA3FF);
const blue50 = Color(0xFF3A85FF);
const blue60 = Color(0xFF0062FF);
const blue100 = Color(0xFF001144);
const green40 = Color(0xFF32C665);
const grey40 = Color(0xFF9A9EA5);
const grey70 = Color(0xFF505258);
const grey90 = Color(0xFF22242A);
const textColor = Color(0xFF696C73);

const bntRadius = 4.0;

const hPadding = EdgeInsets.symmetric(horizontal: 16);
const hPadding12 = EdgeInsets.symmetric(horizontal: 12);
const hPadding28 = EdgeInsets.symmetric(horizontal: 28);

const commonHeight = 38.0;

TextStyle textStyle(
    [double? _fontSize, Color? _color, FontWeight? _fontWeight]) {
  _fontSize ??= 16;
  _color ??= grey90;
  _fontWeight ??= FontWeight.w400;
  return GoogleFonts.roboto(
      textStyle: TextStyle(
          fontSize: _fontSize, color: _color, fontWeight: _fontWeight));
}

const kRadzheb =
    "Меня зовут Раджеб. Я помогу тебе \nпогрузиться в мир инвестиций!";

const kSurveyComplete =
    "У меня для тебя кое-что есть ... \n\nЯ хочу подарить тебе цветок. Он будет отражать твои успехи и неудачи в инвестировании. Уход за ним - метафора на реальные действия инвестора";

const kSurveyPrize =
    "Тебе подходит спокойный стиль инвестирования. Поэтому твое растение - ромашка.";

const kQuizExplanation =
    "Инвестиционный портфель – это набор активов, собранных таким образом, чтобы доход от них соответствовал определенным целям инвестора";

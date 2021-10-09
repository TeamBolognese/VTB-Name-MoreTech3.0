import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const url = "https://vtbmt3.teambolognese.ru/api";
const logoPath = "lib/assets/Logo.svg";

const lightBlue = Color(0xFF00AAFF);
const pureWhite = Color(0xFFFFFFFF);
const blue60 = Color(0xFF0062FF);
const green40 = Color(0xFF32C665);
const grey40 = Color(0xFF9A9EA5);
const grey70 = Color(0xFF505258);
const grey90 = Color(0xFF22242A);

const bntRadius = 4.0;

TextStyle textStyle(
    [double? _fontSize, Color? _color, FontWeight? _fontWeight]) {
  _fontSize ??= 16;
  _color ??= grey90;
  _fontWeight ??= FontWeight.w400;
  return GoogleFonts.roboto(
      textStyle: TextStyle(
          fontSize: _fontSize, color: _color, fontWeight: _fontWeight));
}

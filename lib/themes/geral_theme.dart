import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:flutter/material.dart';

final kGeralTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: ColorTheme.secondaryWhite,
  inputDecorationTheme: InputDecorationTheme().copyWith(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: ColorTheme.secondaryBlue),
    ),
    hintStyle: LetterTheme.placeholder,
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: ColorTheme.borderBlack, width: 0.5),
    ),
  ),
);

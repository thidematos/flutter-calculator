import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:flutter/material.dart';

final AppBar kCustomAppbar = AppBar(
  toolbarHeight: 75,
  title: Row(
    spacing: 12,
    children: [
      Image.asset(
        'assets/logo.png',
        height: 50,
      ),
      Text(
        'ASI CALCULATOR',
        style: LetterTheme.logo.copyWith(
          color: ColorTheme.black,
          letterSpacing: 1,
          fontSize: 24,
        ),
      )
    ],
  ),
);

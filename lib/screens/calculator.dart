import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:calculator/widgets/display/display.dart';
import 'package:calculator/widgets/display/result.dart';
import 'package:calculator/widgets/keyboard/key_button.dart';
import 'package:calculator/widgets/keyboard/keyboard_row.dart';
import 'package:flutter/material.dart';

final List<List<String>> rows = [
  ['C', '%', '÷'],
  ['7', '8', '9', 'x'],
  ['4', '5', '6', '-'],
  ['1', '2', '3', '+'],
  ['0', ',', '='],
];

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Display(),
          Result(),
          Column(
            children: [for (final row in rows) KeyboardRow(row)],
          ),
        ],
      ),
    );
  }
}

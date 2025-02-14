import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:calculator/widgets/display/display.dart';
import 'package:calculator/widgets/display/result.dart';
import 'package:calculator/widgets/keyboard/keyboard_row.dart';
import 'package:calculator/widgets/ui/custom_appbar.dart';
import 'package:flutter/material.dart';

final List<List<String>> rows = [
  ['C', '%', '÷'],
  ['7', '8', '9', 'x'],
  ['4', '5', '6', '-'],
  ['1', '2', '3', '+'],
  ['0', '.', '='],
];

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kCustomAppbar(context, false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Display(),
          Column(
            children: [for (final row in rows) KeyboardRow(row)],
          ),
        ],
      ),
    );
  }
}

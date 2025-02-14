import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:flutter/material.dart';

class LoginSpacer extends StatelessWidget {
  const LoginSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Expanded(
            child: Container(
              color: ColorTheme.borderBlack,
              height: 1,
              width: double.infinity,
            ),
          ),
          Text(
            'ou',
            style: LetterTheme.body.copyWith(
              color: const Color.fromARGB(130, 40, 40, 40),
            ),
          ),
          Expanded(
            child: Container(
              color: ColorTheme.borderBlack,
              height: 1,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

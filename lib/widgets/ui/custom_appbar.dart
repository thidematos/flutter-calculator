import 'package:calculator/services/auth_api.dart';
import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:calculator/widgets/display/history.dart';
import 'package:flutter/material.dart';

AppBar kCustomAppbar(BuildContext context, bool isSignIn) {
  List<Widget> actions = isSignIn
      ? []
      : [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return History();
                },
              );
            },
            icon: Icon(
              Icons.history,
              color: ColorTheme.tertiaryBlue,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: AuthApi.logout,
            icon: Icon(
              Icons.logout,
              size: 32,
              color: ColorTheme.errorRed,
            ),
          )
        ];

  return AppBar(
    toolbarHeight: 75,
    actions: actions,
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
}

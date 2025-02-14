import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/widgets/auth/login_form.dart';
import 'package:calculator/widgets/auth/logo.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryBlue,
      body: Column(
        spacing: 36,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 36),
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            decoration: BoxDecoration(
              color: ColorTheme.primaryWhite,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ColorTheme.borderBlack,
                  offset: Offset(2, 2),
                  spreadRadius: 10,
                  blurRadius: 16,
                )
              ],
            ),
            child: LoginForm(),
          )
        ],
      ),
    );
  }
}

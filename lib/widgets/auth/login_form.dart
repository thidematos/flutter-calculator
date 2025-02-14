import 'package:calculator/screens/sign_in.dart';
import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:calculator/widgets/auth/login_spacer.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      spacing: 24,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            hintText: 'toninho@asimov.com',
          ),
        ),
        TextFormField(
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
          obscureText: true,
          decoration: InputDecoration(
            hintText: '*******',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {},
              splashColor: ColorTheme.secondaryBlue,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorTheme.primaryBlue,
                ),
                child: Text(
                  'LOGIN',
                  textAlign: TextAlign.center,
                  style: LetterTheme.logo.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            LoginSpacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 216, 216, 216),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Sign in',
                  style: LetterTheme.body.copyWith(
                    color: ColorTheme.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}

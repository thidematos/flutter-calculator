import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:calculator/widgets/ui/custom_appbar.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kCustomAppbar,
      backgroundColor: ColorTheme.primaryBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: ColorTheme.primaryWhite,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      offset: Offset(4, 4),
                      color: ColorTheme.borderBlack,
                      spreadRadius: 5)
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 36),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 24,
              ),
              child: Form(
                child: Column(
                  spacing: 24,
                  children: [
                    Text(
                      'New Asimover'.toUpperCase(),
                      style: LetterTheme.body.copyWith(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: LetterTheme.body,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'toninho@asimov.br',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: LetterTheme.body,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Toninho',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: LetterTheme.body,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '*******',
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password confirm',
                          style: LetterTheme.body,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '*******',
                            prefixIcon: Icon(Icons.password),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        child: Text('Sign In'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

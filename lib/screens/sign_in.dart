import 'package:calculator/services/auth_api.dart';
import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:calculator/utils/error_handling.dart';
import 'package:calculator/widgets/ui/custom_appbar.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';
  String passwordConfirm = '';
  String name = '';

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  void submit() async {
    final bool isValidated = _formKey.currentState!.validate();

    if (!isValidated) {
      kShowErrorSnackBar(context, 'Something went wrong');
      return;
    }

    _formKey.currentState!.save();

    if (password.compareTo(passwordConfirm) != 0) {
      kShowErrorSnackBar(context, 'Passwords do not match!');
      return;
    }

    setState(() {
      isLoading = true;
    });

    final bool isSuccessfull = await AuthApi.createUser(email, password);

    if (!isSuccessfull) {
      kShowErrorSnackBar(context, 'Error creating new user');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kCustomAppbar,
      backgroundColor: ColorTheme.primaryBlue,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            validator: (value) {
                              if (value == null || !value.contains('@')) {
                                return 'Enter a valid email';
                              }

                              return null;
                            },
                            onSaved: (value) => email = value!,
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
                            validator: (value) {
                              if (value == null) {
                                return 'You need a name!';
                              }

                              return null;
                            },
                            onSaved: (value) => name = value!,
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
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '*******',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return 'Password needs to be valid';
                              }

                              return null;
                            },
                            onSaved: (value) => password = value!,
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
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '*******',
                              prefixIcon: Icon(Icons.password),
                            ),
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return 'Password needs to be valid!';
                              }

                              return null;
                            },
                            onSaved: (value) => passwordConfirm = value!,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (isLoading) {
                            return;
                          }
                          submit();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: ColorTheme.primaryBlue,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: ColorTheme.primaryWhite,
                                ))
                              : Text(
                                  'Sign In'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: LetterTheme.logo.copyWith(
                                    letterSpacing: 2,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

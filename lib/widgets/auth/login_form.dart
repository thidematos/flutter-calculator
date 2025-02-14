import 'package:calculator/screens/sign_in.dart';
import 'package:calculator/services/auth_api.dart';
import 'package:calculator/themes/color_theme.dart';
import 'package:calculator/themes/letter_theme.dart';
import 'package:calculator/utils/error_handling.dart';
import 'package:calculator/widgets/auth/login_spacer.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    setState(() {
      isLoading = true;
    });

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        isLoading = false;
      });
      kShowErrorSnackBar(context, 'Please, provide an email and password');
      return;
    }

    bool isSuccessfull =
        await AuthApi.login(emailController.text, passwordController.text);

    if (!isSuccessfull) {
      emailController.clear();
      passwordController.clear();
      kShowErrorSnackBar(context, 'Wrong credentials!');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      spacing: 24,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: emailController,
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            hintText: 'toninho@asimov.com',
          ),
        ),
        TextFormField(
          controller: passwordController,
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
              onTap: () {
                if (isLoading) {
                  return;
                }
                login();
              },
              splashColor: ColorTheme.secondaryBlue,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorTheme.primaryBlue,
                ),
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorTheme.primaryWhite,
                        ),
                      )
                    : Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: LetterTheme.logo.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            LoginSpacer(),
            const SizedBox(height: 16),
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

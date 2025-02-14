import 'package:calculator/utils/error_handling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final instance = FirebaseAuth.instance;

class AuthApi {
  AuthApi();

  static createUser(context, email, password) async {
    try {
      final loginData = await instance.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (err) {
      print(err.code);
      kShowErrorSnackBar(context, 'Error: ${err.code}');
    }
  }
}

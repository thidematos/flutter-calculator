import 'package:calculator/utils/error_handling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final instance = FirebaseAuth.instance;

class AuthApi {
  AuthApi();

  static Future<bool> createUser(email, password) async {
    try {
      final loginData = await instance.createUserWithEmailAndPassword(
          email: email, password: password);

      return true;
    } on FirebaseAuthException catch (err) {
      print(err.code);
      return false;
    }
  }

  static Future<bool> login(email, password) async {
    try {
      final user = await instance.signInWithEmailAndPassword(
          email: email, password: password);
      print(user);
      return true;
    } on FirebaseAuthException catch (err) {
      print(err.code);
      return false;
    }
  }
}

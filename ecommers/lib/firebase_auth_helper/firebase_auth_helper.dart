// import 'package:ecommers/constants/routes.dart';
// import 'package:ecommers/screens/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommers/constants/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showAboutDialog(context: context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e, _) {
      Navigator.of(context).pop();
      showMessage(e.code);
      return false;
    }
  }

  Future<bool> SignUp(String email, String password, String address,
      BuildContext context) async {
    try {
      showAboutDialog(context: context);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Get the current user
      User? user = _auth.currentUser;

      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'email': email,
        'address': address,
      });
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e, _) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      showMessage(e.code);
      return false;
    }
  }
}

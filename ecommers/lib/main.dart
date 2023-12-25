import 'package:ecommers/constants/constant.dart';
import 'package:ecommers/constants/theme.dart';
import 'package:ecommers/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommers/firebase_auth_helper/firebase_options/firebase_options.dart';
import 'package:ecommers/screens/Home/home.dart';
import 'package:ecommers/screens/auth_ui/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseConfig.PlatformOptions);
  } catch (e) {
     showMessage(e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      theme: themeData,
      home: StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const WelcomePage();
        },
      ),
    );
  }
}

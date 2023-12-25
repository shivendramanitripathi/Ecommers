import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      border: outLineInputBorder,
      errorBorder: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(),
      disabledBorder: const OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF574182),
      disabledBackgroundColor: Colors.grey,
    )));

OutlineInputBorder outLineInputBorder =
    const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

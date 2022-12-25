import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 237, 236, 236),
    primaryColor: const Color(0xff0089EF),
    cardColor: Color.fromARGB(255, 255, 255, 255),
    textTheme: TextTheme(titleLarge: TextStyle(color: Colors.black)),
    snackBarTheme: SnackBarThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: Color(0xff0089EF),
            fontWeight: FontWeight.bold,
            fontSize: 18)));

final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    cardColor: Color.fromARGB(255, 74, 73, 73),
    textTheme: TextTheme(
        titleLarge: TextStyle(color: Color.fromARGB(255, 243, 242, 242))),
    primaryColor: Color.fromARGB(255, 5, 31, 51),
    snackBarTheme: SnackBarThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 18)));

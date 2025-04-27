import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xffffffff),
    onPrimary: Color(0xffBFBFBF),
    secondary: Color(0xff4572B4),
    onSecondary: Color.fromRGBO(0, 0, 0, 1),
    tertiary: Color(0xff4572B4),
    onTertiary: Color.fromRGBO(191, 191, 191, 0.6),
    secondaryFixedDim: Color.fromRGBO(93, 93, 93, 0.4),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Baris',
      color: Colors.black,
      fontSize: 30,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Bradobrei',
      color: Colors.black,
      fontSize: 19.5,
      height: 0.85,
    ),
    displayLarge: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 23,
      fontFamily: 'Baris',
    ),
    displayMedium: TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 18.5,
      fontFamily: 'Bradobrei',
      height: 0.85,
    ),
    displaySmall: TextStyle(
      color: Color(0xff4572B4),
      fontFamily: 'poppins',
      fontSize: 15,
    ),
    labelMedium: TextStyle(
      color: Colors.black,
      fontFamily: 'Fantuwua',
      fontSize: 18,
    ),
    labelSmall: TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.5),
      fontFamily: 'Lexend',
      fontSize: 12,
    ),
  ),
);

import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xff000000),
    onPrimary: Color(0xffBFBFBF),
    secondary: Color(0xffDC5823),
    onSecondary: Color(0xffBFBFBF),
    tertiary: Color(0xffbfbfbf),
    onTertiary: Color(0xff4E4E4E),
    secondaryFixedDim: Color.fromRGBO(88, 88, 88, 0.188),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Baris',
      color: Color(0xffbfbfbf),
      fontSize: 30,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Bradobrei',
      color: Color(0xffbfbfbf),
      fontSize: 19.5,
      height: 0.85,
    ),
    displayLarge: TextStyle(
      color: Color(0xffbfbfbf),
      fontSize: 23,
      fontFamily: 'Baris',
    ),
    displayMedium: TextStyle(
      color: Color(0xffbfbfbf),
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

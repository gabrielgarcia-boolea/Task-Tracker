import 'package:flutter/material.dart';

const Color customColor = Color(0xFA00FF71);

const List<Color> lightColors = [
  Colors.white,
  Color(0xF3F3FFC5),
  Colors.yellow,
  Colors.black,
  Color(0xFF0288D1),
  Color(0xFFFB6060),
];

const List<Color> darkColors = [
  Color(0xFF5C5C5C),
  Color(0xF3353535),
  Colors.cyanAccent,
  Colors.black,
  Color(0xFF0288D1),
  Color(0xFFFF5A5A),
];

class AppTheme {
  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Oswald'),
      scaffoldBackgroundColor: darkColors[0],
      cardTheme: CardThemeData(color: darkColors[1], elevation: 10.0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: darkColors[2],
        foregroundColor: darkColors[3],
      ),
      appBarTheme: AppBarThemeData(
        backgroundColor: darkColors[4],
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: darkColors[5],
          textStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Roboto'),
      scaffoldBackgroundColor: lightColors[0],
      cardTheme: CardThemeData(color: lightColors[1], elevation: 10.0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lightColors[2],
        foregroundColor: lightColors[3],
      ),
      appBarTheme: AppBarThemeData(
        backgroundColor: lightColors[4],
        foregroundColor: lightColors[0],
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: lightColors[0],
          backgroundColor: lightColors[5],
          textStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

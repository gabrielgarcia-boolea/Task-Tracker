import 'package:flutter/material.dart';

const Color customColor = Color(0xFA00FF71);

const List<Color> colors = [
  customColor,
  Colors.red,
  Colors.white,
  Colors.black,
];

class AppTheme {
  final int selectedColor = 0;

  ThemeData darkTheme() {
    return ThemeData(useMaterial3: true);
  }

  ThemeData theme() {
    return ThemeData(useMaterial3: true);
  }
}

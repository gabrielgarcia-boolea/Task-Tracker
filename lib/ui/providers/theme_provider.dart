import 'package:flutter/material.dart';
import 'package:task_tracker/config/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeData _theme = AppTheme().lightTheme();

  ThemeMode get themeMode => _themeMode;
  ThemeData get theme => _theme;

  bool get isDarkMode => (_themeMode == ThemeMode.dark) ? true : false;

  ThemeData changeTheme() {
    _theme = (_themeMode == ThemeMode.light)
        ? AppTheme().darkTheme()
        : AppTheme().lightTheme();
    _themeMode = (_themeMode == ThemeMode.light)
        ? ThemeMode.dark
        : ThemeMode.light;

    notifyListeners();
    return _theme;
  }
}

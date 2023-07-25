// Theme Provider Inherited Widget
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider({
    required Color seedColor,
    required bool themeMode,
  })  : _seedColor = seedColor,
        _themeMode = themeMode;

  Color _seedColor;
  bool _themeMode;

  Color get seedColor => _seedColor;
  bool get darkMode => _themeMode;

  set seedColor(Color seedColor) {
    _seedColor = seedColor;
    notifyListeners();
  }

  set darkMode(bool themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

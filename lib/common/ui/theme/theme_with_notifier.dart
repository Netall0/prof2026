import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class ThemeWithNotifier extends ChangeNotifier {
  bool _isDark = false;
  bool get dark => _isDark;

  ThemeWithNotifier() {
    _loadTheme();
  }

  static final key = 'dm';

  Brightness get getCurrentTheme =>
      _isDark ? Brightness.dark : Brightness.light;

  Future<void> _loadTheme() async {
      final prefs = await SharedPreferences.getInstance();
      prefs.getBool(key) ?? false;
      notifyListeners();
  }

  Future<void> setTheme() async {
    _isDark = !_isDark;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, _isDark);
    notifyListeners();
  }
}

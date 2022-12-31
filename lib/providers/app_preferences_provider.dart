import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonor/utils/services/services.dart';

class AppPreferencesProvider with ChangeNotifier {
  AppPreferences appPreferences = AppPreferences();

  String _themeMode = 'Auto';
  String get themeMode => _themeMode;

  ThemeMode getThemeMode() {
    switch (_themeMode) {
      case 'Light':
        return ThemeMode.light;
      case 'Dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(String themeMode) async {
    await appPreferences.setThemePref(themeMode);
    _themeMode = themeMode;

    notifyListeners();
  }

  Future<void> initialize() async {
    _themeMode = await appPreferences.getTheme();
    notifyListeners();
  }
}

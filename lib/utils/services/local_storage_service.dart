import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const themeKey = "THEMESETTING";

  Future<void> setThemePref(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(themeKey, value);
  }

  Future<String> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(themeKey) ?? 'Auto';
  }
}

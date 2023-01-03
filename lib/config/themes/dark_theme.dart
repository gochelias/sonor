import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    backgroundColor: CupertinoColors.systemBackground.darkColor,
    scaffoldBackgroundColor: CupertinoColors.systemBackground.darkColor,
    canvasColor: CupertinoColors.systemGrey6.darkColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: CupertinoColors.systemBackground.darkColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: CupertinoColors.systemBackground.darkColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CupertinoColors.darkBackgroundGray.withOpacity(0.8),
    ),
  );
}

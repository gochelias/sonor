import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  const Color bgColor = Color(0xFF0B0B0B);

  return base.copyWith(
    brightness: Brightness.dark,
    backgroundColor: bgColor,
    scaffoldBackgroundColor: bgColor,
    canvasColor: CupertinoColors.systemGrey6.darkColor,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: bgColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: bgColor,
      shadowColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bgColor.withOpacity(0.6),
    ),
  );
}

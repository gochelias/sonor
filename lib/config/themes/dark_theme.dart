import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF0f0f0f),
    scaffoldBackgroundColor: const Color(0xFF0f0f0f),
    canvasColor: CupertinoColors.systemGrey6.darkColor,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF0f0f0f),
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Color(0xFF0f0f0f),
    ),
  );
}

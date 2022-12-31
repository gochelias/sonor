import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    brightness: Brightness.light,
    backgroundColor: CupertinoColors.white,
    scaffoldBackgroundColor: CupertinoColors.white,
    canvasColor: CupertinoColors.white,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: CupertinoColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: CupertinoColors.white,
    ),
  );
}

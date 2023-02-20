import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  const Color bgColor = Color(0xFF0B0B0B);

  Color thumbColor(Set<MaterialState> states) {
    return CupertinoColors.systemGrey4.darkColor;
  }

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
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.resolveWith(thumbColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      selectedItemColor: CupertinoColors.label.darkColor,
      unselectedItemColor: CupertinoColors.secondaryLabel.darkColor,
    ),
  );
}

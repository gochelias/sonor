import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();

  /* const Color bgColor = Color(0xFF0B0B0B); */

  Color thumbColor(Set<MaterialState> states) {
    return CupertinoColors.systemGrey4.darkColor;
  }

  return base.copyWith(
    scaffoldBackgroundColor: CupertinoColors.black,
    canvasColor: CupertinoColors.systemGrey6.darkColor,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: CupertinoColors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: CupertinoColors.black,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.resolveWith(thumbColor),
    ),
    highlightColor: CupertinoColors.darkBackgroundGray,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: CupertinoColors.label.darkColor,
      unselectedItemColor: CupertinoColors.systemGrey6,
    ),
  );
}

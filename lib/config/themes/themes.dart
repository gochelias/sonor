import 'package:flutter/material.dart';

export 'package:sonor/config/themes/dark_theme.dart';
export 'package:sonor/config/themes/light_theme.dart';

class SonorTheme {
  final BuildContext context;

  SonorTheme(this.context);

  Color dynamicColor({required Color color, required Color darkColor}) {
    final Brightness brightness = Theme.of(context).brightness;

    switch (brightness) {
      case Brightness.light:
        return color;
      case Brightness.dark:
        return darkColor;
    }
  }
}

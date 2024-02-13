import 'package:flutter/cupertino.dart';

/// Takes a color and returns the dark version of the color
/// * [color] `Color` The color you want to change to dark
/// * [amount] `double` The amount of dark
Color getDarkColor(Color color, {double amount = 0.35}) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

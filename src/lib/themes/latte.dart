import 'package:flutter/material.dart';

import 'util.dart';

ThemeData latteTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: LatteThemeColors.mantle,
  cardColor: LatteThemeColors.base,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: LatteThemeColors.rosewater,
    selectionColor: LatteThemeColors.overlay0,
  ),
  textTheme: TextTheme(
    bodyLarge: setTextColor(style: lightTextTheme.bodyLarge, color: LatteThemeColors.text),
    bodyMedium: setTextColor(style: lightTextTheme.bodyMedium, color: LatteThemeColors.text),
    bodySmall: setTextColor(style: lightTextTheme.bodySmall, color: LatteThemeColors.text),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: LatteThemeColors.base,
    labelStyle: TextStyle(
      color: LatteThemeColors.subtext0,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1.5,
        color: LatteThemeColors.surface1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1.5,
        color: LatteThemeColors.surface2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 2,
        color: LatteThemeColors.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 2,
        color: LatteThemeColors.red,
      ),
    ),
  ),
);

class LatteThemeColors {
  static const Color rosewater = Color(0xffdc8a78);
  static const Color flamingo = Color(0xffdd7878);
  static const Color pink = Color(0xffea76cb);
  static const Color mauve = Color(0xff8839ef);
  static const Color red = Color(0xffd20f39);
  static const Color maroon = Color(0xffe64553);
  static const Color peach = Color(0xfffe640b);
  static const Color yellow = Color(0xffdf8e1d);
  static const Color green = Color(0xff40a02b);
  static const Color teal = Color(0xff179299);
  static const Color sky = Color(0xff04a5e5);
  static const Color sapphire = Color(0xff209fb5);
  static const Color blue = Color(0xff1e66f5);
  static const Color lavender = Color(0xff7287fd);
  static const Color text = Color(0xff4c4f69);
  static const Color subtext1 = Color(0xff5c5f77);
  static const Color subtext0 = Color(0xff6c6f85);
  static const Color overlay2 = Color(0xff7c7f93);
  static const Color overlay1 = Color(0xff8c8fa1);
  static const Color overlay0 = Color(0xff9ca0b0);
  static const Color surface2 = Color(0xffacb0be);
  static const Color surface1 = Color(0xffbcc0cc);
  static const Color surface0 = Color(0xffccd0da);
  static const Color base = Color(0xffeff1f5);
  static const Color mantle = Color(0xffe6e9ef);
  static const Color crust = Color(0xffdce0e8);
}

import 'package:flutter/material.dart';

import 'util.dart';

ThemeData mochaTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: MochaThemeColors.mantle,
  cardColor: MochaThemeColors.base,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: MochaThemeColors.rosewater,
    selectionColor: MochaThemeColors.overlay0,
  ),
  textTheme: TextTheme(
    bodyLarge: setTextColor(style: darkTextTheme.bodyLarge, color: MochaThemeColors.text),
    bodyMedium: setTextColor(style: darkTextTheme.bodyMedium, color: MochaThemeColors.text),
    bodySmall: setTextColor(style: darkTextTheme.bodySmall, color: MochaThemeColors.text),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: MochaThemeColors.base,
    labelStyle: TextStyle(
      color: MochaThemeColors.subtext0,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1.5,
        color: MochaThemeColors.surface1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1.5,
        color: MochaThemeColors.surface2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 2,
        color: MochaThemeColors.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 2,
        color: MochaThemeColors.red,
      ),
    ),
  ),
);

class MochaThemeColors {
  static const Color rosewater = Color(0xfff5e0dc);
  static const Color flamingo = Color(0xfff2cdcd);
  static const Color pink = Color(0xfff5c2e7);
  static const Color mauve = Color(0xffcba6f7);
  static const Color red = Color(0xfff38ba8);
  static const Color maroon = Color(0xffeba0ac);
  static const Color peach = Color(0xfffab387);
  static const Color yellow = Color(0xfff9e2af);
  static const Color green = Color(0xffa6e3a1);
  static const Color teal = Color(0xff94e2d5);
  static const Color sky = Color(0xff89dceb);
  static const Color sapphire = Color(0xff74c7ec);
  static const Color lavender = Color(0xffb4befe);
  static const Color blue = Color(0xff89b4fa);
  static const Color text = Color(0xffcdd6f4);
  static const Color subtext1 = Color(0xffbac2de);
  static const Color subtext0 = Color(0xffa6adc8);
  static const Color overlay2 = Color(0xff9399b2);
  static const Color overlay1 = Color(0xff7f849c);
  static const Color overlay0 = Color(0xff6c7086);
  static const Color surface2 = Color(0xff585b70);
  static const Color surface1 = Color(0xff45475a);
  static const Color surface0 = Color(0xff313244);
  static const Color base = Color(0xff1e1e2e);
  static const Color mantle = Color(0xff181825);
  static const Color crust = Color(0xff11111b);
  static const Color shadow = Color(0xff010409);
}

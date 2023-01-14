import 'dart:async';

import 'package:flutter/material.dart';

import 'latte.dart';
import 'mocha.dart';

class ThemeProvider {
  final ThemeData darkTheme = mochaTheme;
  final ThemeData lightTheme = latteTheme;

  bool _isDark = true;
  final StreamController<ThemeMode> _streamController = StreamController();
  Stream<ThemeMode> get themeModeStream => _streamController.stream;

  bool get isDark => _isDark;
  set isDark(bool isDark) {
    _isDark = isDark;
    _streamController.add(_isDark ? ThemeMode.dark : ThemeMode.light);
  }

  static final ThemeProvider _instance = ThemeProvider._internal();

  factory ThemeProvider() {
    return _instance;
  }

  ThemeProvider._internal();

  Color get rosewater => isDark ? MochaThemeColors.rosewater : LatteThemeColors.rosewater;
  Color get subtext0 => isDark ? MochaThemeColors.subtext0 : LatteThemeColors.subtext0;
  Color get red => isDark ? MochaThemeColors.red : LatteThemeColors.red;
  Color get green => isDark ? MochaThemeColors.green : LatteThemeColors.green;
  Color get blue => isDark ? MochaThemeColors.blue : LatteThemeColors.blue;
}

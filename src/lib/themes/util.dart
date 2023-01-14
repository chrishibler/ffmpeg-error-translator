import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark();
ThemeData lightTheme = ThemeData.light();
TextTheme darkTextTheme = darkTheme.textTheme;
TextTheme lightTextTheme = lightTheme.textTheme;

TextStyle? setTextColor({TextStyle? style, required Color color}) => style?.copyWith(color: color);

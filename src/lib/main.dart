import 'package:ffmpeg_error_translator/themes/latte.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'themes/mocha.dart';
import 'themes/theme_provider.dart';

void main() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  ThemeProvider().isDark = prefs.getBool("isDark") ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = ThemeProvider();

    return StreamBuilder<ThemeMode>(
        initialData: ThemeMode.dark,
        stream: themeProvider.themeModeStream,
        builder: (context, snapshot) {
          return MaterialApp(
            theme: latteTheme,
            darkTheme: mochaTheme,
            themeMode: snapshot.data ?? ThemeMode.dark,
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

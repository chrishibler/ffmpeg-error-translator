import 'dart:async';

import 'package:ffmpeg_error_translator/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/link.dart';

import 'ffmpeg_error.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ThemeProvider themeProvider = ThemeProvider();
  final TextEditingController controller = TextEditingController();
  IconData? iconToShow;
  InputBorder? border;
  FfmpegError? error;

  void update(String code, BuildContext context) {
    ThemeData theme = Theme.of(context);
    setState(() {
      try {
        error = FfmpegError.parse(code);
        if (error == FfmpegError.invalidError) {
          setInvalidError(theme);
        } else {
          setValidError(theme);
        }
      } catch (e) {
        setInvalidError(theme);
      }
    });
  }

  Future<void> saveThemeChoice(bool isDark) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", isDark);
  }

  void setValidError(ThemeData theme) {
    border = theme.inputDecorationTheme.focusedBorder!;
    iconToShow = Icons.check_circle;
  }

  void setInvalidError(ThemeData theme) {
    if (controller.text.isNotEmpty) {
      error = FfmpegError.invalidError;
      border = theme.inputDecorationTheme.errorBorder!;
      iconToShow = Icons.error;
    } else {
      error = null;
      border = theme.inputDecorationTheme.focusedBorder!;
      iconToShow = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: themeProvider.isDark ? const Icon(Icons.light_mode) : const Icon(Icons.dark_mode),
              onPressed: () async {
                themeProvider.isDark = !themeProvider.isDark;
                unawaited(saveThemeChoice(themeProvider.isDark));
              },
            )
          ],
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'FFMPEG Error',
                              style: TextStyle(
                                fontSize: 24,
                                color: themeProvider.subtext0,
                              ),
                            ),
                            Stack(
                              children: [
                                AnimatedOpacity(
                                  opacity: error == FfmpegError.invalidError ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 250),
                                  child: Icon(Icons.error, color: themeProvider.red),
                                ),
                                AnimatedOpacity(
                                  opacity: (error != null && error != FfmpegError.invalidError) ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 250),
                                  child: Icon(Icons.check_circle, color: themeProvider.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Error code (decimal)',
                            enabledBorder: border,
                            focusedBorder: border,
                          ),
                          controller: controller,
                          onChanged: (text) {
                            update(text, context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: error != null && error != FfmpegError.invalidError ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 250),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectionArea(
                          child: Table(
                            columnWidths: const <int, TableColumnWidth>{
                              0: IntrinsicColumnWidth(),
                              1: FlexColumnWidth(),
                            },
                            children: <TableRow>[
                              _getRow('Decimal value:  ', error?.decimalString ?? ''),
                              _getRow('Hex value:  ', '0x${error?.hexString ?? ''}'),
                              _getRow('Error code:  ', error?.errorCode ?? ''),
                              _getRow('Error:  ', error?.error ?? ''),
                            ],
                          ),
                        ),
                        _LinkButton(
                            linkText: 'Search Google',
                            url: 'https://google.com/search?q=${error?.error}',
                            padding: const EdgeInsets.only(top: 36)),
                        _LinkButton(
                            linkText: 'Search Stackoverflow',
                            url: 'https://stackoverflow.com/search?q=${error?.error}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableRow _getRow(String label, String value) {
    return TableRow(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 6, 12),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(label),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(value),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _LinkButton extends StatelessWidget {
  final String linkText;
  final String url;
  final EdgeInsetsGeometry padding;

  const _LinkButton({
    Key? key,
    required this.linkText,
    required this.url,
    this.padding = const EdgeInsets.only(top: 24),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Link(
        uri: Uri.parse(url),
        target: LinkTarget.blank,
        builder: (context, followLink) {
          return InkWell(
            onTap: followLink,
            child: Text(
              linkText,
              style: TextStyle(
                fontSize: 14,
                color: ThemeProvider().blue,
              ),
            ),
          );
        },
      ),
    );
  }
}

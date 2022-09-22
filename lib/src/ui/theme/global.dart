import 'package:flutter/material.dart';

class Themes {
  static const primaryColor = Color(0xff316dca);
  static const errorColor = Color(0xb3ff6961);
  static const pureWhite = Color(0xffffffff);

  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: const Color(0xfff6f8fa),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Color(0xffd8dee4),
      secondary: Color(0xffd0d7de),
      onSecondary: pureWhite,
      error: errorColor,
      onError: pureWhite,
      background: pureWhite,
      onBackground: Color(0xfff6f8fa),
      surface: Color(0xff24292f),
      onSurface: pureWhite,
    ),
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: const Color(0xff22272e),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: Color(0xff373e47),
      secondary: Color(0xff22272e),
      onSecondary: Color(0xff2d333b),
      error: errorColor,
      onError: pureWhite,
      background: Color(0xff1c2128),
      onBackground: Color(0xff2b333b),
      surface: Color(0xff2d333b),
      onSurface: Color(0xffadbac7),
    ),
  );
}

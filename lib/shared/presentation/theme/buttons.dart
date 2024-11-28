import 'package:flutter/material.dart';

ElevatedButtonThemeData createElevatedButtonThemeData(ThemeData themeData) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

ButtonThemeData createButtonThemeData(ThemeData themeData) {
  final baseStyle = themeData.buttonTheme;

  return baseStyle.copyWith(
      height: 40,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ));
}

TextButtonThemeData createTextButtonThemeData(ThemeData themeData) {
  final baseStyle = themeData.textButtonTheme.style;

  return TextButtonThemeData(
    style: baseStyle?.copyWith(),
  );
}

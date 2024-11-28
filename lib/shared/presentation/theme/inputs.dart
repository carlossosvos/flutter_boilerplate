import 'package:flutter/material.dart';

class InputTheme {
  // A method that returns InputDecorationTheme to pass it to the inputDecorationTheme
  // property of the ThemeData Class  in main.dart

  InputDecorationTheme inputTheme(ThemeData themeData) {
    InputDecorationTheme baseinputTheme = themeData.inputDecorationTheme;

    return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      disabledBorder: _buildOutlineInputBorder(
          baseinputTheme.disabledBorder?.borderSide.color),
      enabledBorder: _buildOutlineInputBorder(
          baseinputTheme.enabledBorder?.borderSide.color),
      focusedBorder: _buildOutlineInputBorder(
          baseinputTheme.focusedBorder?.borderSide.color),
      errorBorder: _buildOutlineInputBorder(
        baseinputTheme.errorBorder?.borderSide.color,
      ),
      focusedErrorBorder: _buildOutlineInputBorder(
        baseinputTheme.focusedErrorBorder?.borderSide.color,
      ),
      errorStyle: _buildTextStyle(
        baseinputTheme.errorStyle?.color,
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(Color? color) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: color ?? Color(0xFF000000),
          width: 1,
        ),
      );

  TextStyle _buildTextStyle(Color? color, {double fontSize = 16}) => TextStyle(
        color: color,
        fontSize: fontSize,
      );
}

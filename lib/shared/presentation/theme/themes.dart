import 'package:flutter/material.dart';
import 'colors.dart';

const lightAppBarTheme = AppBarTheme();
const darkAppBarTheme = AppBarTheme();

final lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  appBarTheme: lightAppBarTheme,
  useMaterial3: true,
);

final darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  appBarTheme: darkAppBarTheme,
  useMaterial3: true,
);

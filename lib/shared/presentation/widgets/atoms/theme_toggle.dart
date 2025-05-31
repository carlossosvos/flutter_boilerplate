import 'package:flutter/material.dart';

/// The `ThemeToggle` class is a Flutter widget that displays a switch for toggling between dark and
/// light modes.

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isDarkMode,
      onChanged: onToggle,
      thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
        if (isDarkMode) {
          return const Icon(Icons.dark_mode);
        }
        return const Icon(Icons.light_mode);
      }),
    );
  }
}

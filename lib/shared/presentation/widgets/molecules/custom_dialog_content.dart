import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

class CustomDialogContent extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomDialogContent({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final currentThemeColors = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16),
        Text(message),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onCancel,
              child: Text(S.of(context).cancel),
            ),
            SizedBox(
              width: 70,
              child: ElevatedButton(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, // Remove default padding
                  backgroundColor: currentThemeColors.secondary,
                ),
                child: Text(
                  S.of(context).confirm,
                  style: TextStyle(
                    color: currentThemeColors.surface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

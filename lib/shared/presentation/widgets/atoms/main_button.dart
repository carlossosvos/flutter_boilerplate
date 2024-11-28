import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/presentation/theme/constants.dart';

class MainButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final bool isLoading;
  final Widget? icon;

  const MainButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final disabledStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.disabledColor,
      foregroundColor: theme.colorScheme.onSurface.withOpacity(0.38),
      elevation: 0.0,
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MIN_VERTICAL_PADDING,
      ),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: isEnabled ? theme.elevatedButtonTheme.style : disabledStyle,
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
              )
            : icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon!,
                      const SizedBox(width: 8),
                      Text(
                        label,
                        style: theme.textTheme.labelLarge,
                      ),
                    ],
                  )
                : Text(
                    label,
                    style: theme.textTheme.labelLarge,
                  ),
      ),
    );
  }
}

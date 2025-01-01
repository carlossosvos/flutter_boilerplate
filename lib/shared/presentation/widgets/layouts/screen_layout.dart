import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  final List<Widget>? children;
  final bool enableRefreshIndicator;
  final Future<void> Function()? onRefresh;
  final Gradient? backgroundGradient;
  final Color? backgroundColor;

  const ScreenLayout({
    super.key,
    this.children,
    this.enableRefreshIndicator = false,
    this.onRefresh,
    this.backgroundGradient,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (
        BuildContext context,
        Orientation orientation,
      ) =>
          Container(
        height: double.infinity,
        width: double.infinity,
        decoration: backgroundGradient != null
            ? BoxDecoration(
                gradient: backgroundGradient,
              )
            : BoxDecoration(
                color: backgroundColor,
              ),
        child: SafeArea(
          child: enableRefreshIndicator && onRefresh != null
              ? RefreshIndicator(
                  onRefresh: onRefresh!,
                  child: _buildColumn(),
                )
              : _buildColumn(),
        ),
      ),
    );
  }

  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children ?? [],
    );
  }
}

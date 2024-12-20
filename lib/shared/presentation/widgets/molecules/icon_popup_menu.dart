// filepath: /Users/cgcasco/development/mystufff/flutter_boilerplate/lib/shared/presentation/widgets/molecules/icon_popup_menu.dart
import 'package:flutter/material.dart';

class IconPopupMenu<T> extends StatelessWidget {
  final List<PopupMenuItem<T>> items;
  final ValueChanged<T?> onSelected;
  final IconData icon;
  final Widget? child;
  final String tooltip;

  const IconPopupMenu({
    super.key,
    required this.items,
    required this.onSelected,
    this.icon = Icons.more_vert,
    this.tooltip = '',
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      icon: child ?? Icon(icon),
      tooltip: tooltip,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return items;
      },
    );
  }
}

import 'package:flutter/material.dart';

/// The `NavBarItem` class represents a navigation bar item with an icon, label, selection state, and
/// tap functionality in Dart.
class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? Theme.of(context).colorScheme.inverseSurface
                : Theme.of(context).colorScheme.onSurface.withOpacity(2 / 3),
          ),
          Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? Theme.of(context).colorScheme.inverseSurface
                  : Theme.of(context).colorScheme.onSurface.withOpacity(2 / 3),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

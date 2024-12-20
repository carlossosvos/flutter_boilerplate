// filepath: /Users/cgcasco/development/mystufff/flutter_boilerplate/lib/shared/presentation/widgets/molecules/icon_dropdown.dart
import 'package:flutter/material.dart';

class IconDropdown<T> extends StatelessWidget {
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final IconData icon;
  final String hint;
  final double? width;
  final double? height;

  const IconDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.icon = Icons.arrow_drop_down,
    this.hint = '',
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          icon: Center(child: Icon(icon)),
          isExpanded: true,
          selectedItemBuilder: (BuildContext context) {
            return items.map<Widget>((DropdownMenuItem<T> item) {
              return Container(); // Return an empty container to hide the selected value
            }).toList();
          },
        ),
      ),
    );
  }
}

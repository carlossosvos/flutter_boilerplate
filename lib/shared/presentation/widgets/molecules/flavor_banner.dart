import 'package:flutter/material.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final String flavor;

  const FlavorBanner({
    super.key,
    required this.child,
    required this.flavor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (flavor.isNotEmpty)
          Positioned(
            top: 0,
            left: 0,
            child: Banner(
              message: flavor,
              location: BannerLocation.topStart,
              color: Colors.lightGreen,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                letterSpacing: 1.0,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
      ],
    );
  }
}

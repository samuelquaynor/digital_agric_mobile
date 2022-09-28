import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';

/// Color dot widget
class ColorDot extends StatelessWidget {
  /// Constructor
  const ColorDot({
    super.key,
    required this.color,
    required this.isActive,
  });

  /// Color
  final Color color;

  /// when color dot is active
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding / 4),
      decoration: BoxDecoration(
        border: Border.all(color: isActive ? primaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        radius: 10,
        backgroundColor: color,
      ),
    );
  }
}

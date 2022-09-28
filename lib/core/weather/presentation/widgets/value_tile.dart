import 'package:flutter/material.dart';

import 'empty_widget.dart';

/// General utility widget used to render a cell divided into three rows
/// First row displays [label]
/// second row displays [iconData]
/// third row displays [value]
class ValueTile extends StatelessWidget {
  /// Constructor
  const ValueTile({
    super.key,
    this.iconData,
    required this.label,
    required this.value,
  });

  /// Tile label
  final String label;

  /// Tile value
  final String value;

  /// Tile icon data
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(color: Colors.greenAccent),
        ),
        const SizedBox(
          height: 5,
        ),
        if (iconData != null)
          Icon(
            iconData,
            size: 20,
          )
        else
          const EmptyWidget(),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
        ),
      ],
    );
  }
}

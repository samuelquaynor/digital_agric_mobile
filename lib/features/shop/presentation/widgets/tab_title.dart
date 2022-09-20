import 'package:flutter/material.dart';

/// Tab title widget
class TabTitle extends StatelessWidget {
  /// Constructor
  const TabTitle(
      {super.key,
      required this.title,
      required this.seeAll,
      this.actionText = 'See All',
      this.padding = 16});

  /// Table title name
  final String title;

  /// Table title action text
  final String actionText;

  /// Table title funciton
  final VoidCallback seeAll;

  /// Table title padding
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Row(children: [
          Expanded(
              child:
                  Text(title, style: Theme.of(context).textTheme.titleMedium)),
          TextButton(onPressed: seeAll, child: Text(actionText))
        ]));
  }
}

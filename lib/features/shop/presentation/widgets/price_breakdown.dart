import 'package:flutter/material.dart';

/// Price breakdown widget
class PriceBreakdown extends StatelessWidget {
  /// Constructor
  const PriceBreakdown({super.key, required this.title, required this.price});

  /// price breakdown title
  final String title;

  /// price breakdown price
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(title),
      const Spacer(),
      Text(price, style: Theme.of(context).textTheme.headline6)
    ]);
  }
}

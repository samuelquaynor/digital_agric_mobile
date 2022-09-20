import 'package:flutter/material.dart';

/// Payment card widget
class PaymentCard extends StatelessWidget {
  /// Constructor
  const PaymentCard({
    super.key,
    this.isSelected = true,
    required this.title,
  });

  /// payment card is selected
  final bool isSelected;

  /// payment card title
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                    color: Colors.grey.shade100,
                    offset: const Offset(24, 40),
                    blurRadius: 80)
              else
                const BoxShadow(color: Colors.transparent)
            ]),
        child: Row(children: [
          Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                  color: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
          const SizedBox(width: 8),
          Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)))
        ]));
  }
}

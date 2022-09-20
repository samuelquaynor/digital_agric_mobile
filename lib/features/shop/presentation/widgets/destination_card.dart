import 'package:flutter/material.dart';

/// Destination card widget
class DestinationCard extends StatelessWidget {
  /// Constructor
  const DestinationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 96,
        width: double.infinity,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: 80,
              width: 80,
              decoration: ShapeDecoration(
                  color: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                Text('Shoo Phar Nhoe',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Flexible(
                  child: Text('Planet Namex, 989 Warhammer Street'),
                ),
                Text('(+78) 8989 8787')
              ]))
        ]));
  }
}

import 'package:flutter/material.dart';

/// Section Title widget
class SectionTitle extends StatelessWidget {
  /// Constructor
  const SectionTitle({
    super.key,
    required this.title,
    required this.pressSeeAll,
  });

  /// Section Title
  final String title;

  /// Section onPress see all
  final VoidCallback pressSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: pressSeeAll,
          child: const Text(
            'See All',
            style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    );
  }
}

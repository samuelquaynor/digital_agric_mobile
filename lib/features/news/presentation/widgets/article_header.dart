import 'package:flutter/material.dart';

/// Article Header Page
class ArticleHeader extends SliverPersistentHeaderDelegate {
  /// Constructor
  ArticleHeader({required this.child});

  /// index number
  int index = 0;

  /// child widget of header
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return child;
    });
  }

  @override
  double get maxExtent => 350;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

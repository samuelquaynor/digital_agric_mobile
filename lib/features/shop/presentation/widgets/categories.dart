import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';
import '../../domain/entities/category.dart';
import 'category_card.dart';

/// Categories Widget
class Categories extends StatelessWidget {
  /// Constructor
  const Categories({super.key, required this.categories});

  /// Categories
  final List<Category?> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => CategoryCard(
                  icon: categories[index]?.icon ?? '',
                  title: categories[index]?.title ?? '',
                  press: () {},
                ),
            separatorBuilder: (context, index) =>
                const SizedBox(width: defaultPadding)));
  }
}

import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';
import '../../domain/entities/product.dart';
import '../pages/buy/details_screen.dart';
import 'product_card.dart';
import 'section_title.dart';

/// New Arrival Widget
class CustomProducts extends StatelessWidget {
  /// Constructor
  const CustomProducts(
      {super.key,
      required this.products,
      required this.title,
      required this.seeAll});

  /// List of products
  final List<Product> products;

  /// title of custom product
  final String title;

  /// onPressed function of custom product
  final VoidCallback seeAll;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(title: title, pressSeeAll: seeAll)),
      SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
                  products.length,
                  (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding),
                      child: ProductCard(
                          title: products[index].name,
                          image: products[index].photoUrl,
                          price: products[index].price,
                          bgColor: Colors.white,
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => DetailsScreen(
                                        product: products[index])));
                          })))))
    ]);
  }
}

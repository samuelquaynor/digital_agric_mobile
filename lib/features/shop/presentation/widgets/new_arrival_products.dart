import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';
import '../../domain/entities/product.dart';
import '../pages/buy/details_screen.dart';
import 'product_card.dart';
import 'section_title.dart';

/// New Arrival Widget
class NewArrivalProducts extends StatelessWidget {
  /// Constructor
  const NewArrivalProducts({super.key, required this.products});

  /// List of products
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(title: 'New Arrival', pressSeeAll: () {})),
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

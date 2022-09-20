import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';

/// Product Card Widget
class ProductCard extends StatelessWidget {
  /// Constructor
  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
  });

  /// image , title of product
  final String image, title;

  /// on press callback
  final VoidCallback press;

  /// price of product
  final double price;

  /// color of product
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
            width: 154,
            padding: const EdgeInsets.all(defaultPadding / 2),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius))),
            child: Column(children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(defaultBorderRadius)),
                  ),
                  child: SizedBox(
                      height: 132,
                      child: FadeInImage(
                          imageErrorBuilder: (context, error, stackTrace) =>
                              Image.asset('assets/images/rice.png',
                                  fit: BoxFit.cover),
                          fit: BoxFit.cover,
                          placeholder:
                              const AssetImage('assets/images/rice.png'),
                          image: NetworkImage(image, scale: 0.0000001)))),
              const SizedBox(height: defaultPadding / 2),
              Row(children: [
                Expanded(
                    child: Text(title,
                        style: const TextStyle(color: Colors.black))),
                const SizedBox(width: defaultPadding / 4),
                Text('GHS$price', style: Theme.of(context).textTheme.subtitle2)
              ])
            ])));
  }
}

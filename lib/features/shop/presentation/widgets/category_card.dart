import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';

/// Categories Card Widget
class CategoryCard extends StatelessWidget {
  /// Constructor

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.press,
  });

  /// Icon, title arguments
  final String icon, title;

  /// onPress callback
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)))),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
            child: Column(children: [
              SizedBox(
                height: 60,
                child: FadeInImage(
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/images/rice.png',
                            fit: BoxFit.cover),
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/images/rice.png'),
                    image: NetworkImage(icon, scale: 1.5)),
              ),
              const SizedBox(height: defaultPadding / 2),
              Text(title, style: Theme.of(context).textTheme.subtitle2)
            ])));
  }
}

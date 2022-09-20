import 'package:flutter/material.dart';

/// Preditiction Carousel
class PredictionCarousel extends StatelessWidget {
  /// Constructor
  const PredictionCarousel(
      {super.key,
      required this.title,
      required this.urlImage,
      required this.onPressed,
      required this.description});

  ///Title of prediction
  final String title;

  ///description of prediction
  final String description;

  /// Prediction image
  final String urlImage;

  /// OnPressed callback
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(urlImage))),
        child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 3),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white, fontSize: 18)),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13))),
                  Align(
                      child: TextButton(
                          onPressed: onPressed,
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Text('Check it out >',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500))))
                ])));
  }
}

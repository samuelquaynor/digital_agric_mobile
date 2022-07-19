import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FarmsPage extends StatelessWidget {
  const FarmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          FontAwesomeIcons.plantWilt,
          size: 20,
          color: Colors.green.shade900,
        ),
        title: Text('Farms', style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, itemIndex, pageViewIndex) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            options: CarouselOptions(
              autoPlayInterval: const Duration(seconds: 10),
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
        ],
      ),
    );
  }
}

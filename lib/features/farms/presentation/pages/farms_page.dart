import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'create_farm.dart';

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
        body: SingleChildScrollView(
          child: Column(children: [
            GestureDetector(
              onTap: () => Navigator.of(context).push<void>(
                  MaterialPageRoute(builder: (context) => const CreateFarm())),
              child: ListTile(
                  title: Text('Create Farm',
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: const Text('Create a farm to track progress'),
                  trailing: const Icon(Icons.arrow_forward)),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)))),
            ),
            ListTile(
                title: Text('Prediction Algorithms',
                    style: Theme.of(context).textTheme.titleMedium),
                trailing: const Icon(Icons.arrow_forward)),
            CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, itemIndex, pageViewIndex) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(borderRadius: BorderRadius.circular(20))),
                options: CarouselOptions(
                    autoPlayInterval: const Duration(seconds: 10),
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true)),
            ListTile(
                title: Text('Plants Info',
                    style: Theme.of(context).textTheme.titleMedium),
                subtitle: const Text('Check more info of plants here'),
                trailing: const Icon(Icons.arrow_forward)),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                        width: 120,
                        height: 120,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.green.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  offset: const Offset(0, 5))
                            ])),
                    const Text('Rice')
                  ],
                ),
                itemCount: 6,
                scrollDirection: Axis.horizontal,
              ),
            )
          ]),
        ));
  }
}

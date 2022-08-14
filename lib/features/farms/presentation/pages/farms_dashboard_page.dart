import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/farm_entity.dart';
import '../bloc/farms_bloc.dart';
import 'create_farm.dart';

class FarmsPage extends StatelessWidget {
  FarmsPage({super.key});

  final bloc = sl<FarmsBloc>();

  List<String> images = [
    'assets/images/crop-prediction.jpg',
    'assets/images/weather-predict.png',
    'assets/images/weed-detect.png'
  ];

  List<String> algorithmsTitle = [
    'Crop Prediction',
    'Weather Prediction',
    'Weed Detection'
  ];

  List<String> algorithmsSubTitle = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et '
  ];

  List<String> crops = [
    'Rice',
    'Tomato',
    'Wheat',
    'Groundnut',
    'Beans',
    'Maize'
  ];

  List<String> cropImages = [
    'assets/images/rice.png',
    'assets/images/tomato.png',
    'assets/images/wheat.png',
    'assets/images/groundnut.png',
    'assets/images/beans.png',
    'assets/images/maize.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(FontAwesomeIcons.plantWilt,
                size: 20, color: Colors.green.shade900),
            title:
                Text('Farms', style: Theme.of(context).textTheme.titleMedium)),
        body: SingleChildScrollView(
            child: Column(children: [
          GestureDetector(
              onTap: () => Navigator.of(context).push<void>(
                  MaterialPageRoute(builder: (context) => const CreateFarm())),
              child: ListTile(
                  title: Text('Create Farm',
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: const Text('Create a farm to track progress'),
                  trailing: const Icon(Icons.arrow_forward))),
          FutureBuilder(
              future: bloc.getFarmsBloc(),
              builder: (context, AsyncSnapshot<List<FarmEntity?>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data?.isEmpty ?? true) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('No Farms Available. '),
                          GestureDetector(
                              onTap: () => Navigator.of(context).push<void>(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateFarm())),
                              child: const Text('Create One',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline)))
                        ]);
                  } else {
                    return SizedBox(
                        height: 150,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) => Column(children: [
                                  Container(
                                      width: 100,
                                      height: 100,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: FadeInImage(
                                          fit: BoxFit.cover,
                                          imageErrorBuilder: (context, error,
                                                  stackTrace) =>
                                              Container(
                                                  decoration: BoxDecoration(
                                                      image: const DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              'assets/images/farm.jpg')),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                          placeholder: const AssetImage(
                                              'assets/images/logo-white-transparentbg.png'),
                                          image: const NetworkImage('avatarUrl'))),
                                  Text('${snapshot.data?[index]?.name}')
                                ])));
                  }
                } else {
                  return SizedBox(
                      height: 160,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Column(children: [
                                Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                        width: 100,
                                        height: 100,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            height: 10,
                                            width: 80,
                                            color: Colors.white)))
                              ])));
                }
              }),
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
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(images[itemIndex]))),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, left: 8, right: 8, bottom: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(algorithmsTitle[itemIndex],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: Colors.white)),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(algorithmsSubTitle[itemIndex],
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500))),
                            Align(
                                child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text('Check it out >',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500))))
                          ]))),
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
                  itemBuilder: (context, index) => Column(children: [
                        Container(
                            width: 120,
                            height: 120,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(cropImages[index])),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.green.withOpacity(0.2),
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                      offset: const Offset(0, 5))
                                ])),
                        Text(crops[index])
                      ]),
                  itemCount: crops.length,
                  scrollDirection: Axis.horizontal))
        ])));
  }
}

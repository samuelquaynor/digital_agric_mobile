import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../injection_container.dart';
import '../../../predictions/presentation/pages/scan_crop.dart';
import '../../domain/entities/crop_info.dart';
import '../../domain/entities/farm_entity.dart';
import '../bloc/farms_bloc.dart';
import '../widgets/prediction_carousel.dart';
import 'create_farm.dart';
import 'crop_info.dart';
import 'single_farm_page.dart';

/// DashboardFarmsPage
class DashboardFarmsPage extends StatefulWidget {
  /// Constructor
  const DashboardFarmsPage({super.key});

  @override
  State<DashboardFarmsPage> createState() => _DashboardFarmsPageState();
}

class _DashboardFarmsPageState extends State<DashboardFarmsPage> {
  final bloc = sl<FarmsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Icon(FontAwesomeIcons.plantWilt,
                size: 20, color: Colors.green.shade900),
            title:
                Text('Farms', style: Theme.of(context).textTheme.titleMedium)),
        body: ListView(shrinkWrap: true, children: [
          GestureDetector(
              onTap: () => Navigator.of(context).push<void>(
                  MaterialPageRoute(builder: (context) => const CreateFarm())),
              child: ListTile(
                  title: Text('Create Farm',
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: const Text('Create a farm to track progress'),
                  trailing: const Icon(Icons.arrow_forward))),
          FutureBuilder<List<FarmEntity?>>(
              future: bloc.getFarmsBloc(),
              builder: (context, snapshot) {
                if (snapshot.data != null && snapshot.data!.isEmpty) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('No Farms Available. '),
                        GestureDetector(
                            onTap: () => Navigator.of(context).push<void>(
                                MaterialPageRoute(
                                    builder: (context) => const CreateFarm())),
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
                          itemBuilder: (context, index) => Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => Navigator.push<void>(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SingleFarmPage(
                                              farm: snapshot.data![index]!,
                                            ))),
                                child: FutureBuilder<String?>(
                                    initialData: '',
                                    future: bloc.getFarmAvatarUrl(
                                        snapshot.data?[index]?.avatar ?? ''),
                                    builder: (context, avatarSnapshot) {
                                      return Column(children: [
                                        Container(
                                            width: 100,
                                            height: 100,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: FadeInImage(
                                                  fit: BoxFit.cover,
                                                  imageErrorBuilder: (context,
                                                          error, stackTrace) =>
                                                      DecoratedBox(
                                                          decoration: BoxDecoration(
                                                              image: const DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: AssetImage(
                                                                      'assets/images/farm.jpg')),
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      15))),
                                                  placeholder: const AssetImage(
                                                      'assets/images/logo-white-transparentbg.png'),
                                                  image: NetworkImage(avatarSnapshot
                                                              .requireData ==
                                                          ''
                                                      ? 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'
                                                      : '${avatarSnapshot.requireData}')),
                                            )),
                                        Text('${snapshot.data?[index]?.name}')
                                      ]);
                                    }),
                              ))));
                }
              }),
          ListTile(
              title: Text('Prediction Algorithms',
                  style: Theme.of(context).textTheme.titleMedium),
              trailing: const Icon(Icons.arrow_forward)),
          // CarouselSlider(
          //     items: [
          //       PredictionCarousel(
          //           title: 'Plant Disease Detection',
          //           urlImage: 'assets/images/weed-detect.png',
          //           onPressed: () {
          //             Navigator.of(context).push(MaterialPageRoute<void>(
          //                 builder: (context) => const ScanCrop()));
          //           },
          //           description:
          //               'Plant Disease Detection Accepts a POST request with an image in the form of base64 string and returns plant, disease and remedy.'),
          //       // PredictionCarousel(
          //       //     title: 'Flood Detection',
          //       //     urlImage: 'assets/images/weather-predict.png',
          //       //     onPressed: () {},
          //       //     description:
          //       //         'Flood Detection API detects flooded areas in a photo using artificial intelligence. Useful  agriculture.'),
          //       // PredictionCarousel(
          //       //     title: 'Cereal Seeds Detection',
          //       //     urlImage: 'assets/images/crop-prediction.jpg',
          //       //     onPressed: () {},
          //       //     description:
          //       //         'This Cereals Seeds Recognition API is used to recognize grain seeds among: wheat, maize, oat, barley, rye, quinoa, millet, sorgh.'),
          //     ],
          //     options: CarouselOptions(
          //         autoPlayInterval: const Duration(seconds: 10),
          //         height: 220,
          //         enlargeCenterPage: true)),
          Container(
            height: 220,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: PredictionCarousel(
                title: 'Plant Disease Detection',
                urlImage: 'assets/images/weed-detect.png',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => const ScanCrop()));
                },
                description:
                    'Plant Disease Detection Accepts a POST request with an image in the form of base64 string and returns plant, disease and remedy.'),
          ),
          ListTile(
              title: Text('Plants Info',
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: const Text('Check more info of plants here'),
              trailing: const Icon(Icons.arrow_forward)),

          FutureBuilder<List<CropInfo?>>(
              future: bloc.getCropInfoBloc(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LinearProgressIndicator();
                } else {
                  return SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemBuilder: (context, index) => Column(children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push<void>(
                                      MaterialPageRoute(
                                          builder: (context) => CropInfoScreen(
                                              cropInfo:
                                                  snapshot.data?[index]))),
                                  child: Container(
                                      width: 120,
                                      height: 120,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.green
                                                    .withOpacity(0.2),
                                                blurRadius: 5,
                                                spreadRadius: 3,
                                                offset: const Offset(0, 5))
                                          ]),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: FadeInImage(
                                            imageErrorBuilder: (context, error,
                                                    stackTrace) =>
                                                Image.asset(
                                                    'assets/images/rice.png',
                                                    fit: BoxFit.cover),
                                            fit: BoxFit.cover,
                                            placeholder: const AssetImage(
                                                'assets/images/rice.png'),
                                            image: NetworkImage(
                                                snapshot.data?[index]
                                                        ?.photoUrl ??
                                                    '',
                                                scale: 1.5)),
                                      )),
                                ),
                                Text(snapshot.data?[index]?.name ?? '')
                              ]),
                          itemCount: snapshot.data?.length,
                          scrollDirection: Axis.horizontal));
                }
              })
        ]));
  }
}

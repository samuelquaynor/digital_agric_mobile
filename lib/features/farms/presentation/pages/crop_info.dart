import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';
import '../../domain/entities/crop_info.dart';

/// Crop Info Screen
class CropInfoScreen extends StatefulWidget {
  /// Constructor
  const CropInfoScreen({super.key, required this.cropInfo});

  /// Crop Info Data
  final CropInfo? cropInfo;

  @override
  State<CropInfoScreen> createState() => _CropInfoScreenState();
}

class _CropInfoScreenState extends State<CropInfoScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.green.shade900,
                icon: const Icon(Icons.arrow_back)),
            title: Text('${widget.cropInfo?.name}',
                style: Theme.of(context).textTheme.titleMedium)),
        bottomSheet: Container(
            width: double.infinity,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                child: !isLoading
                    ? const Text('Read More')
                    : const FittedBox(
                        child: CircularProgressIndicator(color: Colors.white)),
                onPressed: () async {})),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: FadeInImage(
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset('assets/images/rice.png', fit: BoxFit.cover),
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/images/rice.png'),
                  image: NetworkImage(widget.cropInfo?.photoUrl ?? ''))),
          const SizedBox(height: defaultPadding * 1.5),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultBorderRadius * 3),
                      topRight: Radius.circular(defaultBorderRadius * 3))),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                            child: Text(widget.cropInfo?.name ?? '',
                                style: Theme.of(context).textTheme.headline6)),
                        const SizedBox(width: defaultPadding),
                        Text(widget.cropInfo?.plantType ?? '',
                            style: Theme.of(context).textTheme.headline6)
                      ]),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: Text(widget.cropInfo?.description ?? '')),
                      ListTile(
                          title: const Text('Bloom Time:'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          trailing: Text('${widget.cropInfo?.bloomTime}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                      ListTile(
                          title: const Text('Days to Harvest:'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          trailing: Text(
                              '${widget.cropInfo?.daysToHarvest} days',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                      ListTile(
                          title: const Text('Flower Color:'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          trailing: Text('${widget.cropInfo?.flowerColor}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                      ListTile(
                          title: const Text('Germination Period:'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          trailing: Text(
                              '${widget.cropInfo?.germinationPeriod} days',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                      ListTile(
                          title: const Text('Soil PH:'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          trailing: Text('${widget.cropInfo?.soilPH}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                      ListTile(
                          title: const Text('Soil Temperature:'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          trailing: Text(
                              '${widget.cropInfo?.soilTemperature} C',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                      ListTile(
                          title: const Text('Sun Exposure:'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          trailing: Text('${widget.cropInfo?.sunExposure}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                      ListTile(
                          title: const Text('Varieties:'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          subtitle: Text(
                              '${widget.cropInfo?.varieties.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                      ListTile(
                          title: const Text('Pests:'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          subtitle: Text('${widget.cropInfo?.pests.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                      ListTile(
                          title: const Text('Diseases:'),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          subtitle: Text(
                              '${widget.cropInfo?.diseases.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black))),
                    ]),
              ))
        ])));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/data/constants.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/plant_disease_entity.dart';
import '../bloc/predictions_bloc.dart';
import 'pdf_gen.dart';

/// prediction result page
class ResultPage extends StatefulWidget {
  /// Constructor
  const ResultPage(
      {super.key, required this.plantDiseaseEntity, required this.imagePath});

  /// plant_disease_entity
  final PlantDiseaseEntity plantDiseaseEntity;

  /// plant disease image path
  final String imagePath;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isLoading = false;

  final bloc = sl<PredictionsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back, color: Colors.green.shade900)),
            // actions: [
            //   IconButton(
            //       onPressed: () async {
            //         final result =
            //             await bloc.sendAlertsBloc(widget.plantDiseaseEntity);
            //         if (result) {
            //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //               content: Text(
            //                   'Success! The Alert has been sent to everyone')));
            //         } else {
            //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //               content: Text(
            //                   'Notification Failed')));
            //         }
            //       },
            //       icon: const Icon(Icons.notifications_active,
            //           color: Colors.red)),
            // ],
            title: Text('Your Crop Analysis Report',
                style: Theme.of(context).textTheme.titleMedium)),
        bottomSheet: Container(
            width: double.infinity,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                child: !isLoading
                    ? const Text('Make Pdf Report')
                    : const FittedBox(
                        child: CircularProgressIndicator(color: Colors.white)),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await makeReport(
                      plant: widget.plantDiseaseEntity.plant,
                      disease: widget.plantDiseaseEntity.disease,
                      remedy: widget.plantDiseaseEntity.remedy);
                  setState(() {
                    isLoading = false;
                  });
                })),
        body: SingleChildScrollView(
          child: Column(children: [
            Image.file(File(widget.imagePath),
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                fit: BoxFit.cover),
            const SizedBox(height: defaultPadding * 1.5),
            Container(
                padding: const EdgeInsets.fromLTRB(defaultPadding,
                    defaultPadding * 2, defaultPadding, defaultPadding),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(defaultBorderRadius * 3),
                        topRight: Radius.circular(defaultBorderRadius * 3))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Expanded(
                            child: Text(widget.plantDiseaseEntity.plant,
                                style: Theme.of(context).textTheme.headline6)),
                        const SizedBox(width: defaultPadding),
                        Text(widget.plantDiseaseEntity.disease,
                            style: Theme.of(context).textTheme.headline6)
                      ]),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: Text(widget.plantDiseaseEntity.remedy)),
                      // const Padding(
                      //     padding:
                      //         EdgeInsets.symmetric(vertical: defaultPadding),
                      //     child: Text(
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //             decoration: TextDecoration.underline),
                      //         'Hit the bell icon on the top right corner to send alert to all farmers')),
                      const SizedBox(height: defaultPadding * 2)
                    ])),
          ]),
        ));
  }
}

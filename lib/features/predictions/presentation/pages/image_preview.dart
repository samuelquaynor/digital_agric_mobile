import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../bloc/predictions_bloc.dart';
import 'result_page.dart';

/// Image preview page
class ImagePreview extends StatefulWidget {
  /// Constructor
  const ImagePreview({super.key, required this.imagePath});

  /// image path
  final String imagePath;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  bool isLoading = false;
  final bloc = sl<PredictionsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back, color: Colors.green.shade900)),
            title: Text('Preview your image',
                style: Theme.of(context).textTheme.titleMedium)),
        bottomSheet: Container(
            width: double.infinity,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                child: !isLoading
                    ? const Text('Send')
                    : const FittedBox(
                        child: CircularProgressIndicator(color: Colors.white)),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  final result =
                      await bloc.plantDiseasePredictorBloc(widget.imagePath);
                  setState(() {
                    isLoading = false;
                  });
                  await Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              plantDiseaseEntity: result, imagePath: widget.imagePath)));
                })),
        body: Column(children: [
          Image.file(File(widget.imagePath),
              height: MediaQuery.of(context).size.height * 0.85,
              width: double.infinity,
              fit: BoxFit.cover)
        ]));
  }
}

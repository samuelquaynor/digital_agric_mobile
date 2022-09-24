import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'camera_page.dart';

/// Scan crop page
class ScanCrop extends StatelessWidget {
  /// Constructor
  const ScanCrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back, color: Colors.green.shade900)),
            title: Text('Scan Crop',
                style: Theme.of(context).textTheme.titleMedium)),
        body: Center(
            child: Container(
                width: double.infinity,
                height: 250,
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  Text('Upload your Images',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('PNg and JPG files are allowed',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(fontSize: 14)),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CameraPage()));
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(FontAwesomeIcons.cloudArrowUp,
                                  color: Colors.greenAccent.withOpacity(0.9),
                                  size: 38),
                              Text(
                                  'Click to take a picture or select a picture from gallery',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400))
                            ]),
                      ),
                    ),
                  ))
                ]))));
  }
}

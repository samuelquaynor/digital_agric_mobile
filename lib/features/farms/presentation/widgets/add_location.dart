import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/models/prediction.dart';
import 'PredictionTile.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController pickupController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  FocusNode focusDestination = FocusNode();
  bool focused = false;
  void setFocus() {
    if (!focused) {
      FocusScope.of(context).requestFocus(focusDestination);
      focused = true;
    }
  }

  String mapKey = 'AIzaSyB-DXDM28-apXG86HbxwKu6Q7ZI7V0BqS4';

  List<Prediction> destinationPredictionList = [];

  Future<dynamic> getRequest(String url) async {
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final data = response.body;
        final dynamic decodedData = jsonDecode(data);
        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      //  return 'failed';
      print(e);
    }
  }

  Future<void> searchPlace(String placeName) async {
    if (placeName.length > 1) {
      final url =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=123254251&components=country:gh';
      final dynamic response = await getRequest(url);
      if (response == 'failed') {
        print('RESPONSE FAILED ON SEARCH');
        return;
      }
      if (response['status'] == 'OK') {
        final dynamic predictionJson = response['predictions'];
        final thisList = (predictionJson as List)
            .cast<Map<String, dynamic>>()
            .map(Prediction.fromJson)
            .toList();
        setState(() {
          destinationPredictionList = thisList;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Container(
          height: 160,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 0.5,
                offset: Offset(0.7, 0.7))
          ]),
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, top: 48, right: 24, bottom: 20),
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                Stack(children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  Center(
                    child: Text('Set Location',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                ]),
                const SizedBox(
                  height: 18,
                ),
                // Row(children: <Widget>[
                //   Image.asset('assets/images/pickicon.png',
                //       height: 16, width: 16),
                //   const SizedBox(width: 18),
                //   Expanded(
                //       child: Container(
                //           decoration: BoxDecoration(
                //               color: Colors.grey.shade200,
                //               borderRadius: BorderRadius.circular(4)),
                //           child: Padding(
                //               padding: const EdgeInsets.all(2.0),
                //               child: TextField(
                //                   controller: pickupController,
                //                   decoration: InputDecoration(
                //                       hintText: 'Pickup Location',
                //                       fillColor: Colors.grey.shade200,
                //                       filled: true,
                //                       border: InputBorder.none,
                //                       isDense: true,
                //                       contentPadding: EdgeInsets.only(
                //                           left: 10, top: 8, bottom: 8))))))
                // ]),
                // const SizedBox(height: 10),
                Row(children: <Widget>[
                  Image.asset('assets/images/desticon.png',
                      height: 16, width: 16),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: TextField(
                                  onChanged: searchPlace,
                                  focusNode: focusDestination,
                                  controller: destinationController,
                                  decoration: InputDecoration(
                                      hintText: 'Location?',
                                      fillColor: Colors.grey.shade200,
                                      filled: true,
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: const EdgeInsets.only(
                                          left: 10, top: 8, bottom: 8))))))
                ])
              ])))),
      if (destinationPredictionList.isNotEmpty)
        Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                itemBuilder: (context, index) {
                  return PredictionTile(
                      prediction: destinationPredictionList[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                        height: 1, color: Color(0xffe2e2e2), thickness: 1),
                itemCount: destinationPredictionList.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics()))
      else
        Container()
    ])));
  }
}

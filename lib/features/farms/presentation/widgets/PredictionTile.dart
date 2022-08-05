import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/models/address.dart';
import '../../data/models/prediction.dart';

class PredictionTile extends StatefulWidget {
  const PredictionTile({required this.prediction});
  final Prediction prediction;

  @override
  State<PredictionTile> createState() => _PredictionTileState();
}

class _PredictionTileState extends State<PredictionTile> {
  String mapKey = 'AIzaSyB-DXDM28-apXG86HbxwKu6Q7ZI7V0BqS4';

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

  Future<Address?> getPlaceDetails(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$mapKey';
    final dynamic response = await getRequest(url);
    if (response == 'failed') {
      print('failed');
      return null;
    }
    if (response['status'] == 'OK') {
      final thisPlace = Address();
      thisPlace.placeName = response['result']['name'] as String;
      thisPlace.placeId = placeId;
      thisPlace.latitude =
          response['result']['geometry']['location']['lat'] as double;
      thisPlace.longitude =
          response['result']['geometry']['location']['lng'] as double;
      Navigator.of(context).pop();
      return thisPlace;
    } else {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () async {
          showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                    content: Row(children: const <Widget>[
                  CircularProgressIndicator.adaptive(),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text('Loading...'))
                ]));
              });
          final response =
              await getPlaceDetails(widget.prediction.placeId!.toString());
          Navigator.of(context).pop<Address>(response);
        },
        child: Container(
            color: Colors.white,
            child: Column(children: [
              const SizedBox(height: 8),
              Row(children: <Widget>[
                const Icon(Icons.location_on, color: Color(0xFFadadad)),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      Text('${widget.prediction.mainText}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 2),
                      Text('${widget.prediction.secondaryText}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xFFadadad)))
                    ]))
              ]),
              const SizedBox(height: 8)
            ])));
  }
}

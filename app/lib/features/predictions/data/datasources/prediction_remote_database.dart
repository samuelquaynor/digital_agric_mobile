import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/plant_disease_entity.dart';

/// PredictionRemoteRepository
abstract class PredictionRemoteDatabase {
  /// http for plant disease predictor
  Future<PlantDiseaseEntity> plantDiseasePredictor(String imagePath);

  /// Send alerts to user using http
  Future<bool> sendAlerts(PlantDiseaseEntity entity);
}

//// Implement [PredictionRemoteDatabase] Repository
class PredictionRemoteDatabaseImpl implements PredictionRemoteDatabase {
  @override
  Future<PlantDiseaseEntity> plantDiseasePredictor(String imagePath) async {
    final imageBytes = File(imagePath).readAsBytesSync();
    final imageBase64 = base64Encode(imageBytes);

    final dio = Dio();

    final response = await dio.post<String>(
        'https://plant-disease-detector-pytorch.herokuapp.com/',
        data: {'image': imageBase64});

    final jsonResponse = json.decode(response.data!) as Map<String, dynamic>;

    return PlantDiseaseEntity.fromJson(jsonResponse);
  }

  @override
  Future<bool> sendAlerts(PlantDiseaseEntity entity) async {
    final user = FirebaseAuth.instance.currentUser;
    final dio = Dio();

    final response = await dio.post<String>(
        'https://plant-disease-detector-pytorch.herokuapp.com/notification',
        data: {
          'plant': entity.plant,
          'disease': entity.disease,
          'user': user?.displayName
        });
    if (response.data == 'Success') {
      return true;
    }
    return false;
  }
}

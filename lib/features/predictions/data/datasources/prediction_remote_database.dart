import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/entities/plant_disease_entity.dart';

/// PredictionRemoteRepository
abstract class PredictionRemoteDatabase {
  /// http for plant disease predictor
  Future<PlantDiseaseEntity> plantDiseasePredictor(String imagePath);
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
    print(response);

    final jsonResponse = json.decode(response.data!) as Map<String, dynamic>;
    print(jsonResponse);

    return PlantDiseaseEntity.fromJson(jsonResponse);
  }
}

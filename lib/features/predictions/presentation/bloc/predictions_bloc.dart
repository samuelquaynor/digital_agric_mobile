import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/crop_info.dart';
import '../../domain/entities/plant_disease_entity.dart';
import '../../domain/usecases/get_crop_info.dart';
import '../../domain/usecases/plant_disease_usc.dart';
import '../../domain/usecases/send_alerts.dart';

/// Prediction Bloc
class PredictionsBloc {
  /// Constructor
  PredictionsBloc(
      {required this.sendAlertUsc,
      required this.plantDiseasePredictorUsc,
      required this.getCropInfo});

  /// PlantDiseasePredictor usecase
  final PlantDiseasePredictor plantDiseasePredictorUsc;

  /// Get Crop Info Usecase
  final GetCropInfo getCropInfo;

  /// Send alert Usecase
  final SendAlert sendAlertUsc;

  /// plantDiseasePredictor bloc
  Future<PlantDiseaseEntity> plantDiseasePredictorBloc(String imagePath) async {
    final result = await plantDiseasePredictorUsc(StringParams(imagePath));
    return result.fold((l) => PlantDiseaseEntity.initial(), (r) => r);
  }

  /// Get Categories from usecase
  Future<List<CropInfo?>> getCropInfoBloc() async {
    final result = await getCropInfo(NoParams());
    return result.fold((l) => [], (r) => r);
  }

  /// send alerts bloc
  Future<bool> sendAlertsBloc(PlantDiseaseEntity plantDiseaseEntity) async {
    final result = await sendAlertUsc(SendAlertParams(plantDiseaseEntity));
    return result.fold((l) => false, (r) => r);
  }
}

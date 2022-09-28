import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/plant_disease_entity.dart';
import '../../domain/usecases/plant_disease_usc.dart';

/// Prediction Bloc
class PredictionsBloc {
  /// Constructor
  PredictionsBloc(this.plantDiseasePredictorUsc);

  /// PlantDiseasePredictor usecase
  final PlantDiseasePredictor plantDiseasePredictorUsc;

  /// plantDiseasePredictor bloc
  Future<PlantDiseaseEntity> plantDiseasePredictorBloc(String imagePath) async {
    final result = await plantDiseasePredictorUsc(StringParams(imagePath));
    return result.fold((l) => PlantDiseaseEntity.initial(), (r) => r);
  }
}

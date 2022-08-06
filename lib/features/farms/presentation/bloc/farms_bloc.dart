import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/farm_entity.dart';
import '../../domain/usecases/create_farm.dart';
import '../../domain/usecases/get_farms.dart';

part 'farms_event.dart';
part 'farms_state.dart';

/// Farm Bloc
class FarmsBloc {
  /// Constructor
  FarmsBloc({required this.createFarm, required this.getFarm});

  /// Create Farm Usecase
  final CreateFarm createFarm;

  /// Get Farm Usecase
  final GetFarm getFarm;

  /// Create a Farm
  Future<String?> createFarmBloc(FarmEntity farm) async {
    final result = await createFarm(CreateFarmParams(farm));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Query Farms
  Future<List<FarmEntity?>> getFarmsBloc() async {
    final result = await getFarm(NoParams());
    return result.fold((l) => [], (r) => r);
  }
}

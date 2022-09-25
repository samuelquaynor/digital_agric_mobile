import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/user/domain/usecases/retrieveUser.dart';
import '../../domain/entities/crop_info.dart';
import '../../domain/entities/farm_entity.dart';
import '../../domain/usecases/create_farm.dart';
import '../../domain/usecases/get_crop_info.dart';
import '../../domain/usecases/get_farms.dart';

part 'farms_event.dart';
part 'farms_state.dart';

/// Farm Bloc
class FarmsBloc {
  /// Constructor
  FarmsBloc(
      {required this.retrieveUser,
      required this.createFarm,
      required this.getCropInfo,
      required this.getFarm});

  /// Retrieve User Usecase
  final RetrieveUser retrieveUser;

  /// Create Farm Usecase
  final CreateFarm createFarm;

  /// Get Farm Usecase
  final GetFarm getFarm;

  /// Get Crop Info Usecase
  final GetCropInfo getCropInfo;

  /// Create a Farm
  Future<String?> createFarmBloc(FarmEntity farm) async {
    final result = await createFarm(CreateFarmParams(farm));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Query Farms
  Future<List<FarmEntity?>> getFarmsBloc() async {
    final result = await retrieveUser(const RetrieveUserParams());
    return result.fold((l) => [], (r) => r.farms);
  }

   /// Get Categories from usecase
  Future<List<CropInfo?>> getCropInfoBloc() async {
    final result = await getCropInfo(NoParams());
    return result.fold((l) => [], (r) => r);
  }
}

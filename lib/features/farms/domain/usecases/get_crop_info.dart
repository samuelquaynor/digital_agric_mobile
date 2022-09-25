import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/crop_info.dart';
import '../repositories/farm_repository.dart';

/// Get CropInfo Usecase
class GetCropInfo implements UseCase<List<CropInfo>, NoParams> {
  /// Constructor
  GetCropInfo(this.repository);

  /// Farm Repository instance
  final FarmRepository repository;

  @override
  Future<Either<Failure, List<CropInfo>>> call(NoParams params) =>
      repository.getCropInfos();
}

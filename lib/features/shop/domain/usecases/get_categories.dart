import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/category.dart';
import '../repositories/shop_repository.dart';

/// Get Categories usecase
class GetCategories implements UseCase<List<Category>, NoParams> {
  /// Constructor
  GetCategories(this.repository);

  /// ShopRepository
  final ShopRepository repository;

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) =>
      repository.getCategories();
}

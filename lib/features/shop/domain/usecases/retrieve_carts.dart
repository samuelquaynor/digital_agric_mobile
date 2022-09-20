import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cart.dart';
import '../repositories/shop_repository.dart';

/// Save Carts usecase
class RetrieveCarts implements UseCase<List<Cart?>, RetrieveCartParams> {
  /// Constructor
  RetrieveCarts(this.repository);

  /// Shop Repository
  final ShopRepository repository;

  @override
  Future<Either<Failure, List<Cart?>>> call(RetrieveCartParams params) async =>
      repository.retrieveCarts(params.local);
}

/// Get retieve cart Params
class RetrieveCartParams extends Equatable {
  /// Constructor
  const RetrieveCartParams({this.local = true});

  /// Whether take info from local or remote database
  final bool local;

  @override
  List<Object> get props => [local];
}

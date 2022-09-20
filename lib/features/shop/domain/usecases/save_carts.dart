import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cart.dart';
import '../repositories/shop_repository.dart';

/// Save Carts usecase
class SaveCarts implements UseCase<String?, SaveCartsParams> {
  /// Constructor
  SaveCarts(this.repository);

  /// Shop Repository
  final ShopRepository repository;

  @override
  Future<Either<Failure, String?>> call(SaveCartsParams params) async =>
      repository.saveCarts(params.carts);
}

/// Save Carts usecase params
class SaveCartsParams extends Equatable {
  /// Constructor
  const SaveCartsParams(this.carts);

  /// List of carts
  final List<Cart?> carts;

  @override
  List<Object> get props => [carts];
}

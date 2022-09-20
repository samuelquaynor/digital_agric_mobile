import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/order_entity.dart';
import '../repositories/shop_repository.dart';

/// Create Order usecase
class CreateOrderkUsc implements UseCase<String?, CreateOrderUscParams> {
  /// Constructor
  CreateOrderkUsc(this.repository);

  /// Shop Repository
  final ShopRepository repository;

  @override
  Future<Either<Failure, String?>> call(CreateOrderUscParams params) =>
      repository.createOrder(params.order);
}

/// Create Order usecase params
class CreateOrderUscParams extends Equatable {
  /// Constructor
  const CreateOrderUscParams(this.order);

  /// Order entity
  final OrderEntity order;

  @override
  List<Object> get props => [order];
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/cart.dart';
import '../entities/category.dart';
import '../entities/order_entity.dart';

/// ShopRepository
abstract class ShopRepository {
  /// queries list of categories from firebase
  Future<Either<Failure, List<Category>>> getCategories();

  /// queries list of carts from firebase
  Future<Either<Failure, String?>> saveCarts(List<Cart?> carts);

  /// queries list of carts from firebase
  Future<Either<Failure, List<Cart?>>> retrieveCarts({required bool local});

  /// queries list of orders from firebase
  Future<Either<Failure, String?>> createOrder(OrderEntity orderEntity);
}

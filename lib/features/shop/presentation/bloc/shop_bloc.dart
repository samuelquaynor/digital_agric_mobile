import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/usecases/retrieveUser.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/usecases/create_order.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/retrieve_carts.dart';
import '../../domain/usecases/save_carts.dart';

part 'shop_event.dart';
part 'shop_state.dart';

/// ShopBloc
class ShopBloc {
  /// Constructor
  ShopBloc(
      {required this.retrieveCarts,
      required this.retrieveUser,
      required this.createOrderUsc,
      required this.saveCarts,
      required this.getCategories});

  /// Get Categories usecase
  final GetCategories getCategories;

  /// Get RetrieveCarts usecase
  final RetrieveCarts retrieveCarts;

  /// Get SaveCarts usecase
  final SaveCarts saveCarts;

  /// Retrieve User Usecase
  final RetrieveUser retrieveUser;

  /// Create Orders Usecase
  final CreateOrderkUsc createOrderUsc;

  /// Create an order
  Future<String?> createOrderBloc(OrderEntity order) async {
    final result = await createOrderUsc(CreateOrderUscParams(order));
    await retrieveUser(const RetrieveUserParams(localUser: false));
    return result.fold((l) => l.toString(), (r) => null);
  }

  /// Get User
  Future<UserEntity> retrieveUserBloc() async {
    final result = await retrieveUser(const RetrieveUserParams());
    return result.fold((l) => UserEntity.initial(), (r) => r);
  }

  /// Get Categories from usecase
  Future<List<Category?>> getCategoriesBloc() async {
    final result = await getCategories(NoParams());
    return result.fold((l) => [], (r) => r);
  }

  /// save carts from usecase
  Future<String?> saveCartBloc(List<Cart?> carts) async {
    final result = await saveCarts(SaveCartsParams(carts));
    return result.fold((l) => l.message, (r) => r);
  }

  /// Get carts from usecase
  Future<List<Cart?>> retrieveCartBloc() async {
    final result = await retrieveCarts(const RetrieveCartParams());
    return result.fold((l) => [], (r) => r);
  }
}

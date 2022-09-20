import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/farms/domain/entities/farm_entity.dart';
import '../../features/shop/domain/entities/cart.dart';
import '../../features/shop/domain/entities/category.dart';
import '../../features/shop/domain/entities/product.dart';
import '../../features/tasks/domain/entities/tasks_entity.dart';
import '../user/domain/entities/user.dart';

/// Add adapters to Hive per entity
class HiveAdapters {
  /// User entity
  static const user = 0;

  /// Order entity
  static const order = 1;

  /// Farm entity
  static const farm = 3;

  /// Tasks entity
  static const tasks = 4;

  /// Product entity
  static const product = 5;

  /// Category entity
  static const category = 6;

  /// Cart entity
  static const cart = 7;

  /// Initialize adapters when app starts
  static Future<void> setUp() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDirectory.path)
      ..registerAdapter<UserEntity>(UserEntityAdapter())
      ..registerAdapter<FarmEntity>(FarmEntityAdapter())
      ..registerAdapter<TasksEntity>(TasksEntityAdapter())
      ..registerAdapter<Product>(ProductAdapter())
      ..registerAdapter<Cart>(CartAdapter())
      ..registerAdapter<Category>(CategoryAdapter());
  }
}

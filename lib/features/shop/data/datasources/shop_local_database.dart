import 'package:hive/hive.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entities/cart.dart';

/// ShopLocalDatabase
abstract class ShopLocalDatabase {
  /// returns a cart model
  Future<List<Cart?>> retrieveCarts();

  /// Saves a cart model
  Future<void> save(List<Cart?> saveCarts);
}

/// Implements [ShopLocalDatabase]
class ShopLocalDatabaseImpl implements ShopLocalDatabase {
  /// Constructor
  ShopLocalDatabaseImpl(this.hiveInterface);

  /// Hive database instance for storing data
  final HiveInterface hiveInterface;

  /// BoxName for [CartAdapter]
  static const String _boxName = 'carts';

  /// Returns a hive instance of a cart model
  Future<List<Cart?>> _retrieveCartsBox() async {
    try {
      final box = await hiveInterface.openBox<List<Cart?>>(_boxName);
      return box.get(0) ?? [];
    } catch (error) {
      await hiveInterface.deleteBoxFromDisk(_boxName);
      return _retrieveCartsBox();
    }
  }

  @override
  Future<List<Cart?>> retrieveCarts() async {
    try {
      final carts = await _retrieveCartsBox();
      return carts;
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }

  @override
  Future<void> save(List<Cart?> carts) async {
    try {
      final box = await hiveInterface.openBox<List<Cart?>>(_boxName);
      await box.put(0, carts);
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }
}

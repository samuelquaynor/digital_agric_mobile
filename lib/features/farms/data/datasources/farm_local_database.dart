import 'package:hive/hive.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entities/farm_entity.dart';

abstract class FarmLocalDatabase {
  /// returns a farm model
  Future<FarmEntity> retrieve();

  /// Saves a farm model
  Future<void> save(FarmEntity farm);
}

class FarmLocalDatabaseImpl extends FarmLocalDatabase {
  /// Constructor
  FarmLocalDatabaseImpl(this.hiveInterface);

  final HiveInterface hiveInterface;

  /// BoxName for [FarmAdapter]
  static const String _boxName = 'farm';

  @override
  Future<void> save(FarmEntity farm) async {
    try {
      final box = await hiveInterface.openBox<FarmEntity>(_boxName);
      await box.put(3, farm);
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }

  @override
  Future<FarmEntity> retrieve() async {
    try {
      final farm = await _retrieveBox();
      return farm;
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }

  /// Returns a hive instance of a farm model
  Future<FarmEntity> _retrieveBox() async {
    try {
      final box = await hiveInterface.openBox<FarmEntity>(_boxName);
      return box.get(3) ?? FarmEntity.initial();
    } catch (error) {
      await hiveInterface.deleteBoxFromDisk(_boxName);
      return _retrieveBox();
    }
  }
}

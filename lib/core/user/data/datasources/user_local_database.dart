import 'package:hive/hive.dart';

import '../../../error/exception.dart';
import '../../domain/entities/user.dart';

/// Access user data stored locally
abstract class UserLocalDatabase {
  /// returns a user model
  Future<UserEntity> retrieve();

  /// Saves a user model
  Future<void> save(UserEntity user);
}
/// Implements [UserLocalDatabase]
class UserLocalDatabaseImpl implements UserLocalDatabase {
  /// Constructor
  UserLocalDatabaseImpl(this.hiveInterface);

  /// Hive database instance for storing data
  final HiveInterface hiveInterface;

  /// BoxName for [UserAdapter]
  static const String _boxName = 'user';

  /// Returns a hive instance of a user model
  Future<UserEntity> _retrieveBox() async {
    try {
      final box = await hiveInterface.openBox<UserEntity>(_boxName);
      return box.get(0) ?? UserEntity.initial();
    } catch (error) {
      await hiveInterface.deleteBoxFromDisk(_boxName);
      return _retrieveBox();
    }
  }

  @override
  Future<UserEntity> retrieve() async {
    try {
      final user = await _retrieveBox();
      return user;
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }

  @override
  Future<void> save(UserEntity user) async {
    try {
      final box = await hiveInterface.openBox<UserEntity>(_boxName);
      await box.put(0, user);
    } catch (error) {
      throw DeviceException('Device Error!\nInsufficient storage space');
    }
  }
}

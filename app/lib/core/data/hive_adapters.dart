import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/predictions/domain/entities/crop_info.dart';
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

  /// Cart entity
  static const cropInfo = 8;

  /// Cart entity
  static const farmerCrop = 9;

  /// Initialize adapters when app starts
  static Future<void> setUp() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDirectory.path)
      ..registerAdapter<UserEntity>(UserEntityAdapter())
      ..registerAdapter<CropInfo>(CropInfoAdapter());
  }
}

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/farms/domain/entities/farm_entity.dart';
import '../../features/tasks/domain/entities/tasks_entity.dart';

/// Add adapters to Hive per entity
class HiveAdapters {
  /// User entity
  static const farm = 3;
  static const tasks = 4;

  /// Initialize adapters when app starts
  static Future<void> setUp() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDirectory.path)
      ..registerAdapter<FarmEntity>(FarmEntityAdapter())
      ..registerAdapter<TasksEntity>(TasksEntityAdapter());
  }
}

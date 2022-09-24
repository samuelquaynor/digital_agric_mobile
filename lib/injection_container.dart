import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'core/platform/network_info.dart';
import 'core/user/user_injection.dart';
import 'core/weather/weather_injection.dart';
import 'features/farms/farm_injection.dart';
import 'features/login/login_injection.dart';
import 'features/news/news_injection.dart';
import 'features/predictions/prediction_injection.dart';
import 'features/settings/settings_injection.dart';
import 'features/shop/shop_injection.dart';
import 'features/signup/sign_up_injection.dart';
import 'features/tasks/task_injection.dart';

/// Getter
final sl = GetIt.instance;

/// Initialize
void init() {
  //! Core
  initCore();
  //! Features
  initFeatures();
//! External
  initExternal();
}

/// Core files
void initCore() {
  ///Weather Dependencies
  initWeather();

  initUser();

  // Network Package
  sl
      // Network Package
      .registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);
}

/// Initialize features
void initFeatures() {
  // Login dependencies
  initLogin();

  initSignUp();

  initSettings();

  initNews();

  initFarm();

  initTasks();

  initShop();

  initPrediction();
}

/// External packages
void initExternal() {
  sl.registerLazySingleton<HiveInterface>(() => Hive);
}

import 'package:get_it/get_it.dart';

import 'core/platform/network_info.dart';
import 'core/weather/weather_injection.dart';

/// Getter
final sl = GetIt.instance;

/// Initialize
void init() {
  //! Core
  initCore();
  //! Features
//   initFeatures();
// //! External
//   initExternal();
}

/// Core files
void initCore() {
  ///Weather Dependencies
  initWeather();

  // Network Package
  sl
      // Network Package
      .registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);
}

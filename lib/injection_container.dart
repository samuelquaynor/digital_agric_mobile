import 'package:get_it/get_it.dart';

import 'core/platform/network_info.dart';
import 'core/user/user_injection.dart';
import 'core/weather/weather_injection.dart';
import 'features/login/login_injection.dart';
import 'features/news/news_injection.dart';
import 'features/settings/settings_injection.dart';
import 'features/signup/sign_up_injection.dart';

/// Getter
final sl = GetIt.instance;

/// Initialize
void init() {
  //! Core
  initCore();
  //! Features
  initFeatures();
// //! External
//   initExternal();
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

void initFeatures() {
  // Login dependencies
  initLogin();

  initSignUp();

  initSettings();

  initNews();
}

import 'package:get_it/get_it.dart';

import 'presentation/bloc/settings_bloc.dart';

/// Add settings injections
void initSettings() {
  final sl = GetIt.instance;
  //Bloc
  sl.registerFactory(() => SettingsBloc(
        retrieveUser: sl(),
        logout: sl(),
      ));
}
import 'package:get_it/get_it.dart';

import 'presentation/bloc/login_bloc.dart';

/// Login Injection
void initLogin() {
  final sl = GetIt.instance;
  //Bloc
  sl.registerFactory(
      () => LoginBloc(sl()));
}

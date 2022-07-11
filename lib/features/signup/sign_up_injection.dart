import 'package:get_it/get_it.dart';

import 'presentation/bloc/signup_bloc.dart';


/// Sign up user params
void initSignUp() {
  final sl = GetIt.instance;
  //Bloc
  sl.registerFactory(
      () => SignupBloc(sl()));
}

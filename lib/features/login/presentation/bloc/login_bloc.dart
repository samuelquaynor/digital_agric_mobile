import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/user/domain/usecases/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc {
  LoginBloc(this.login) : super();

  /// Login User
  final Login login;

  /// Login a user
  Future<String?> loginUser(String email, String password) async {
    final result = await login(
        LoginParams(email: email, password: password));
    return result.fold((failure) => failure.toString(), (success) => null);
  }
}

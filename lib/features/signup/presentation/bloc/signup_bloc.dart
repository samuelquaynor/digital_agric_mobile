import 'package:equatable/equatable.dart';

import '../../../../core/user/domain/usecases/sign_up.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc {
  SignupBloc(this.signUp) : super();

  /// Create a user account
  final SignUp signUp;

  /// Create user
  Future<String?> signUpUser(
      {required String email,
      required String password,
      required String fullName}) async {
    final result = await signUp(
        SignUpParams(email: email, password: password, fullName: fullName));
    return result.fold((failure) => failure.toString(), (success) => null);
  }
}

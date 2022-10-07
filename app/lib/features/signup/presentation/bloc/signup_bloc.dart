import '../../../../core/user/domain/usecases/sign_up.dart';

/// Sign up bloc
class SignupBloc {
  /// Constructor
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

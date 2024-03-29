import '../../../../core/user/domain/usecases/login.dart';

/// Login Bloc
class LoginBloc {
  /// Constructor
  LoginBloc(this.login) : super();

  /// Login User
  final Login login;

  /// Login a user
  Future<String?> loginUser(String email, String password) async {
    final result = await login(LoginParams(email: email, password: password));
    return result.fold((failure) => failure.toString(), (success) => null);
  }
}

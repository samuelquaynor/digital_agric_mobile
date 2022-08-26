import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../repositories/user_repository.dart';

/// Login Usecase
class Login implements UseCase<UserCredential, LoginParams> {
  /// Constructor
  Login(this.repository);

  /// User Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, UserCredential>> call(LoginParams params) =>
      repository.loginWithEmailAndPassword(
          password: params.password, email: params.email);
}

/// Login Parms
class LoginParams extends Equatable {
  /// Constructor
  const LoginParams({required this.email, required this.password});

  /// Email Address
  final String email;

  /// User password
  final String password;
  @override
  List<Object> get props => [email, password];
}

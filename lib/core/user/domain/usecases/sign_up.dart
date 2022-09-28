import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../repositories/user_repository.dart';

/// Sign up usecase
class SignUp implements UseCase<String?, SignUpParams> {
  /// Constructor
  SignUp(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, String?>> call(SignUpParams params) =>
      repository.signUpWithEmailAndPassword(
          password: params.password,
          email: params.email,
          fullName: params.fullName);
}

/// Creating a user account params
class SignUpParams extends Equatable {
  /// Constructor
  const SignUpParams(
      {required this.email, required this.password, required this.fullName});

  /// Email Address
  final String email;

  /// Password
  final String password;

  /// Full name
  final String fullName;

  @override
  List<Object> get props => [email, password];
}

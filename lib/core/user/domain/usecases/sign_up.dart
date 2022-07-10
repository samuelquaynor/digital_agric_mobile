import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../repositories/user_repository.dart';

class SignUp implements UseCase<UserCredential, SignUpParams> {
  /// Constructor
  SignUp(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, UserCredential>> call(SignUpParams params) =>
      repository.signUpWithEmailAndPassword(
        password: params.password,
        email: params.email,
      );
}

/// Creating a user account params
class SignUpParams extends Equatable {
  /// Constructor
  const SignUpParams({
    required this.email,
    required this.password,
  });

  /// Email Address
  final String email;

  /// Password
  final String password;

  @override
  List<Object> get props => [email, password];
}

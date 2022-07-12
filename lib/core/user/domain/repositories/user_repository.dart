import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../error/failures.dart';

abstract class UserRepository {
  User get currentUser;

  bool get isLoggedIn;

  Future<Either<Failure, UserCredential>> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword(
      {required String email, required String password});

  Future<void> logout();
}

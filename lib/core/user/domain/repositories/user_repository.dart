import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../error/failures.dart';
import '../entities/user.dart';

/// User Repository
abstract class UserRepository {
  /// Retrieves the current user details from firebase cache.
  User get currentUser;

  /// Checks if user is already logged in
  bool get isLoggedIn;

  /// Retrieve Complete User Details From Firestore
  Future<Either<Failure, UserEntity>> retrieveUser(bool localUser);

  /// Login With Email and Password
  Future<Either<Failure, UserCredential>> loginWithEmailAndPassword(
      {required String email, required String password});

  /// Sign Up With Email and Password
  Future<Either<Failure, String?>> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullName});

  /// Logs out a user
  Future<void> logout();
}

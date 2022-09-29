import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../error/failures.dart';
import '../entities/user.dart';

/// User Repository
abstract class UserRepository {
  /// Retrieves the current user details from firebase cache.
  User? get currentUser;

  /// Checks if user is already logged in
  bool get isLoggedIn;

  /// Retrieve Complete User Details From Firestore
  Future<Either<Failure, UserEntity>> retrieveUser({required bool localUser});

  /// Login With Email and Password
  Future<Either<Failure, UserCredential>> loginWithEmailAndPassword(
      {required String email, required String password});

  /// Sign Up With Email and Password
  Future<Either<Failure, String?>> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullName});

  /// Updates a user info
  Future<Either<Failure, UserEntity>> update(UserEntity user);

  /// Logs out a user
  Future<void> logout();

  /// Change user password
  Future<Either<Failure, String?>> changePassword(String password);
}

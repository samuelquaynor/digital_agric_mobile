import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../error/failures.dart';
import '../../../platform/network_info.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  /// Constructor
  UserRepositoryImpl(this.networkInfo);

  /// Network information
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, UserCredential>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await networkInfo.hasInternet();
      final res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(res);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? ''));
    } on Exception {
      return const Left(Failure('Error while logging in'));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await networkInfo.hasInternet();
      final res = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(res);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message ?? ''));
    } on Exception {
      return const Left(Failure('Error while logging in'));
    }
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  bool get isLoggedIn =>
      // ignore: avoid_bool_literals_in_conditional_expressions
      FirebaseAuth.instance.currentUser == null ? false : true;
}

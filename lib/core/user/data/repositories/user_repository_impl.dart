// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../error/exception.dart';
import '../../../error/failures.dart';
import '../../../platform/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_database.dart';

/// User Repository Implementation
class UserRepositoryImpl implements UserRepository {
  /// Constructor
  UserRepositoryImpl({required this.networkInfo, required this.localDatabase});

  /// Network information
  final NetworkInfo networkInfo;

  /// Remote database
  final UserLocalDatabase localDatabase;

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
  Future<Either<Failure, String?>> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullName}) async {
    try {
      await networkInfo.hasInternet();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userNew) async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userNew.user?.uid)
            .set({
              'email': email,
              'name': fullName,
              'avatar': '',
              'phoneNumber': ''
            }.cast<String, dynamic>());
      });
      return const Right(null);
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

  @override
  Future<Either<Failure, UserEntity>> retrieveUser(
      {required bool localUser}) async {
    final uid = currentUser?.uid ?? '';
    if (uid == '') return right(UserEntity.initial());
    try {
      await networkInfo.hasInternet();
      final usere = await localDatabase.retrieve();
      if (localUser) return Right(usere);
      final fireUser = FirebaseFirestore.instance.collection('users');
      final user = await fireUser.doc(uid).get();
      final userResult = UserEntity(
          id: user.id,
          email: user.get('email') as String,
          name: user.get('name') as String,
          avatar: user.get('avatar') as String?,
          phoneNumber: user.get('phoneNumber') as String?);
      await localDatabase.save(userResult);
      return Right(userResult);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> update(UserEntity userEntity) async {
    try {
      await networkInfo.hasInternet();
      final user = FirebaseAuth.instance.currentUser;
      final fireUser = FirebaseFirestore.instance.collection('users');
      final userUpdate = fireUser.doc(user?.uid);
      final updateName = await userUpdate.update({
        'name': userEntity.name,
        'avatar': userEntity.avatar,
        'phoneNumber': userEntity.phoneNumber
      });
      final updateEmail = await user?.updateEmail(userEntity.email);
      if (userEntity.password != null && userEntity.password != '') {
        final updatePassword = user?.updatePassword(userEntity.password ?? '');
      }
      return Right(userEntity);
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, String?>> changePassword(String password) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.updatePassword(password);
      return const Right(null);
    } on Exception {
      return const Left(Failure('Change password failed'));
    }
  }
}

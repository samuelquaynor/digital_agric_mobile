import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';
import '../../../usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';
/// Log out User
class Logout{
  /// Constructor
  Logout(this.repository);

  /// Repository
  final UserRepository repository;

  Future<void> call(NoParams params) => repository.logout();
}

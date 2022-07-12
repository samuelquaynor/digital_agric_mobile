import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../repositories/user_repository.dart';

class GetUser  {
  /// Constructor
  GetUser(this.repository);

  final UserRepository repository;

  @override
  User call(NoParams params) => repository.currentUser;
}

import 'package:firebase_auth/firebase_auth.dart';

import '../../../usecases/usecase.dart';
import '../repositories/user_repository.dart';

/// GEt user
class GetUser {
  /// Constructor
  GetUser(this.repository);

  /// User Repository
  final UserRepository repository;

/// Class call
  User? call(NoParams params) => repository.currentUser;
}

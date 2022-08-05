import 'package:firebase_auth/firebase_auth.dart';

import '../../../usecases/usecase.dart';
import '../repositories/user_repository.dart';

class GetUser  {
  /// Constructor
  GetUser(this.repository);

  final UserRepository repository;

  @override
  User call(NoParams params) => repository.currentUser;
}

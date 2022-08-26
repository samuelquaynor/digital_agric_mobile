import 'package:dartz/dartz.dart';

import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Gets complete user details usecse
class RetrieveUser implements UseCase<UserEntity, NoParams> {
  /// Constructor
  RetrieveUser(this.repository);

  /// User Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) =>
      repository.retrieveUser();
}

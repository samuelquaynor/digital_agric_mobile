import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Gets complete user details usecse
class RetrieveUser implements UseCase<UserEntity, RetrieveUserParams> {
  /// Constructor
  RetrieveUser(this.repository);

  /// User Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, UserEntity>> call(RetrieveUserParams params) =>
      repository.retrieveUser(params.localUser);
}

/// Get user details Params
class RetrieveUserParams extends Equatable {
  /// Constructor
  const RetrieveUserParams({this.localUser = true});

  /// Whether take info from local or remote database
  final bool localUser;

  @override
  List<Object> get props => [localUser];
}

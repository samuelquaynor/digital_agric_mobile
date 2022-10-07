import 'package:dartz/dartz.dart';

import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../repositories/user_repository.dart';

/// Chnage password usecase
class ChangePasswordUsc implements UseCase<String?, StringParams> {
  /// Constructor
  ChangePasswordUsc(this.repository);

  /// User Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, String?>> call(StringParams params) =>
      repository.changePassword(params.value);
}

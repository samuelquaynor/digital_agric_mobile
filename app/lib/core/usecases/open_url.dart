import 'package:dartz/dartz.dart';

import '../error/failures.dart';
import '../platform/launch_info.dart';
import 'usecase.dart';

/// Open a url using launch info
class OpenUrl implements UseCase<bool, StringParams> {
  /// Constructor
  OpenUrl(this.repository);

  /// Repository
  final LaunchInfo repository;

  @override
  Future<Either<Failure, bool>> call(StringParams params) =>
      repository.launchUrl(params.value);
}

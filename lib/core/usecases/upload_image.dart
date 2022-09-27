import 'package:dartz/dartz.dart';

import '../error/failures.dart';
import '../platform/gallery_info.dart';
import 'usecase.dart';

/// [UploadFirebaseImage] usecase
class UploadFirebaseImage implements UseCase<String, StringParams> {
  /// Constructor
  UploadFirebaseImage(this.repository);

  /// Repository
  final GalleryInfo repository;

  @override
  Future<Either<Failure, String>> call(StringParams params) =>
      repository.uploadImage(params.value);
}

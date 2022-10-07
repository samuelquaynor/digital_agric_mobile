import 'package:dartz/dartz.dart';

import '../error/failures.dart';
import '../platform/gallery_info.dart';
import 'usecase.dart';
/// Get one image from gallery
class OpenImageGallery implements UseCase<String, NoParams> {
  /// Constructor
  OpenImageGallery(this.repository);

  /// Repository
  final GalleryInfo repository;

  @override
  Future<Either<Failure, String>> call(NoParams params) =>
      repository.retrieveImage();
}

import 'package:dartz/dartz.dart';

import '../error/failures.dart';
import '../platform/gallery_info.dart';
import 'usecase.dart';

/// Get multiple images from gallery
class OpenMultipleImageGallery implements UseCase<List<String>, NoParams> {
  /// Constructor
  OpenMultipleImageGallery(this.repository);

  /// Repository
  final GalleryInfo repository;

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) =>
      repository.retrieveMultipleImages();
}

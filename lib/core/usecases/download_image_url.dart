import 'package:dartz/dartz.dart';

import '../error/failures.dart';
import '../platform/gallery_info.dart';
import 'usecase.dart';

/// Download Image Url from firebase
class DownLoadImageUrl implements UseCase<String, StringParams> {
  /// Constructor
  DownLoadImageUrl(this.info);

  /// GalleryInfo
  final GalleryInfo info;

  @override
  Future<Either<Failure, String>> call(StringParams params) =>
      info.downloadImageUrl(params.value);
}

import 'package:dartz/dartz.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/source.dart';

import '../../../../core/error/failures.dart';

/// News Repository
abstract class NewsRepository {
  /// Get news top headlines
  Future<Either<Failure, List<Article>>> getTopHeadlines();

  /// Get all news
  Future<Either<Failure, List<Article>>> getEverything();

  /// Get news source
  Future<Either<Failure, List<Source>>> getSource();
}

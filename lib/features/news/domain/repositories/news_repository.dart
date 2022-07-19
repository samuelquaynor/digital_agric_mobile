import 'package:dartz/dartz.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/source.dart';

import '../../../../core/error/failures.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<Article>>> getTopHeadlines();
  Future<Either<Failure, List<Article>>> getEverything();
  Future<Either<Failure, List<Source>>> getSource();
}

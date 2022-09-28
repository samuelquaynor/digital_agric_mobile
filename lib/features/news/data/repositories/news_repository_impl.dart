import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/model/source.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/news_repository.dart';

/// Implementation of [NewsRepository]
class NewsRepositoryImpl extends NewsRepository {
  /// News Api key
  NewsAPI newsApi = NewsAPI(
    'f49e7f7e56904338b7b8eedff9943f83',
  );
  @override
  Future<Either<Failure, List<Article>>> getEverything() {
    // TODO: implement getEverything
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Source>>> getSource() {
    // TODO: implement getSource
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Article>>> getTopHeadlines() async {
    try {
      final topHeadlines = await newsApi.getTopHeadlines(
        country: 'ng',
      );
      return Right(topHeadlines);
    } on PlatformException {
      return const Left(Failure('News Retrieval Failed.'));
    }
  }
}

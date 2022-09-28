import 'package:dartz/dartz.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/news_repository.dart';

/// Get Headlines usecase
class GetHeadlines implements UseCase<List<Article>, NoParams> {
  /// Constructor
  GetHeadlines(this.repository);

  
  /// Weather respository
  final NewsRepository repository;

  @override
  Future<Either<Failure, List<Article>>> call(NoParams params) =>
      repository.getTopHeadlines();
}

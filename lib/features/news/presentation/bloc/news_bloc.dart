import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_headlines.dart';

part 'news_event.dart';
part 'news_state.dart';

/// News Bloc
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  /// Constructor
  NewsBloc(this.getHeadlines) : super(NewsInitialState()) {
    on<FetchNewsFromRepoEvent>(getHeadlineNewsBloc);
  }

  /// Get the headlines news bloc
  Future<void> getHeadlineNewsBloc(
      FetchNewsFromRepoEvent event, Emitter<NewsState> emit) async {
    final headlines = await getHeadlines(NoParams());
    emit(headlines.fold(
        (l) => const NewsErrorState(errorMessage: 'News Failed'),
        (r) => NewsLoadedState(newsList: r)));
  }

  /// GetHeadlines usecase
  final GetHeadlines getHeadlines;
}

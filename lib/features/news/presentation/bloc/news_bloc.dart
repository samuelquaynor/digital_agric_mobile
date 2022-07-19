import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/getHeadlines.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  /// Constructor
  NewsBloc(this.getHeadlines) : super(NewsInitialState()) {
    on<FetchNewsFromRepoEvent>(getHeadlineNewsBloc);
  }

  Future<void> getHeadlineNewsBloc(
      FetchNewsFromRepoEvent event, Emitter<NewsState> emit) async {
    final headlines = await getHeadlines(NoParams());
    emit(headlines.fold(
        (l) => const NewsErrorState(errorMessage: 'News Failed'),
        (r) => NewsLoadedState(newsList: r)));
  }

  final GetHeadlines getHeadlines;
}

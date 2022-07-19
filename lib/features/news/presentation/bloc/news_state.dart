part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  const NewsLoadedState({required this.newsList});
  final List<Article> newsList;

  @override
  List<Object> get props => [newsList];
}

class NewsErrorState extends NewsState {
  const NewsErrorState({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

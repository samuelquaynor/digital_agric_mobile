part of 'news_bloc.dart';

/// News State
abstract class NewsState extends Equatable {
  /// Constructor
  const NewsState();

  @override
  List<Object> get props => [];
}

/// Initial News State
class NewsInitialState extends NewsState {}

/// News Loading State
class NewsLoadingState extends NewsState {}

/// News loaded State
class NewsLoadedState extends NewsState {
  /// Constructor
  const NewsLoadedState({required this.newsList});

  /// News List
  final List<Article> newsList;

  @override
  List<Object> get props => [newsList];
}

/// News Error State
class NewsErrorState extends NewsState {
  /// Constructor
  const NewsErrorState({required this.errorMessage});

  /// Error Message
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

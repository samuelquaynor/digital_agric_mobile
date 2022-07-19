part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class InitialNewsEvent extends NewsEvent {}

class FetchNewsFromMemoryEvent extends NewsEvent {}

class FetchNewsFromRepoEvent extends NewsEvent {
  @override
  List<Object> get props => [];
}

// class NewsLoadedEvent extends NewsEvent {
//   @override
//   List<Object> get props => [];
// }

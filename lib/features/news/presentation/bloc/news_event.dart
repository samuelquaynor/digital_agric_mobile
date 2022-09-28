part of 'news_bloc.dart';

/// News Event
abstract class NewsEvent extends Equatable {
  /// Constructor
  const NewsEvent();

  @override
  List<Object> get props => [];
}

/// InitialNew Event
class InitialNewsEvent extends NewsEvent {}

/// Fetch News From Memomey Event
class FetchNewsFromMemoryEvent extends NewsEvent {}

/// Fetch News From Repository Event
class FetchNewsFromRepoEvent extends NewsEvent {
  @override
  List<Object> get props => [];
}

// class NewsLoadedEvent extends NewsEvent {
//   @override
//   List<Object> get props => [];
// }

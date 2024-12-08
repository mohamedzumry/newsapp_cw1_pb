part of 'top_headlines_bloc.dart';

sealed class TopHeadlinesEvent extends Equatable {
  const TopHeadlinesEvent();

  @override
  List<Object> get props => [];
}

class LoadTopHeadlinesEvent extends TopHeadlinesEvent {
  const LoadTopHeadlinesEvent();

  @override
  List<Object> get props => [];
}

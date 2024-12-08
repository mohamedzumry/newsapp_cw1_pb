part of 'top_headlines_bloc.dart';

sealed class TopHeadlinesState extends Equatable {
  const TopHeadlinesState();

  @override
  List<Object> get props => [];
}

final class TopHeadlinesInitial extends TopHeadlinesState {}

class TopHeadlinesLoading extends TopHeadlinesState {}

class TopHeadlinesLoadedState extends TopHeadlinesState {
  final List<News> topHeadlines;

  const TopHeadlinesLoadedState({
    required this.topHeadlines,
  });

  @override
  List<Object> get props => [topHeadlines];
}

class TopHeadlinesError extends TopHeadlinesState {
  final String message;

  const TopHeadlinesError({required this.message});

  @override
  List<Object> get props => [message];
}

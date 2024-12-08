part of 'latest_news_bloc.dart';

sealed class LatestNewsState extends Equatable {
  const LatestNewsState();

  @override
  List<Object> get props => [];
}

final class LatestNewsInitial extends LatestNewsState {}

class LatestNewsLoading extends LatestNewsState {
  const LatestNewsLoading();

  @override
  List<Object> get props => [];
}

class LatestNewsLoadedState extends LatestNewsState {
  final List<News> latestNews;

  const LatestNewsLoadedState({required this.latestNews});

  @override
  List<Object> get props => [latestNews];
}

class LatestNewsError extends LatestNewsState {
  final String message;

  const LatestNewsError({required this.message});

  @override
  List<Object> get props => [message];
}

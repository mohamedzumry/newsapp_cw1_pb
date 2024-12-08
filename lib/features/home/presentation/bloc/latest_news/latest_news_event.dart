part of 'latest_news_bloc.dart';

sealed class LatestNewsEvent extends Equatable {
  const LatestNewsEvent();

  @override
  List<Object> get props => [];
}

class LoadLatestNewsEvent extends LatestNewsEvent {
  const LoadLatestNewsEvent();

  @override
  List<Object> get props => [];
}

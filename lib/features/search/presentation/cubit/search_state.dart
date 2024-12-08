part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {
  const SearchLoading();

  @override
  List<Object> get props => [];
}

final class SearchLoaded extends SearchState {
  final String query;
  final List<News> news;
  const SearchLoaded({required this.news, required this.query});

  @override
  List<Object> get props => [news];
}

final class SearchError extends SearchState {
  final String message;
  const SearchError({required this.message});

  @override
  List<Object> get props => [message];
}

part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryPageLoadingState extends CategoryState {
  const CategoryPageLoadingState();

  @override
  List<Object> get props => [];
}

class CategoryPageLoadedState extends CategoryState {
  final String category;
  final List<News> news;
  const CategoryPageLoadedState({required this.category, required this.news});
  @override
  List<Object> get props => [category, news];
}

class CategoryPageLoadingErrorState extends CategoryState {
  final String message;
  const CategoryPageLoadingErrorState(this.message);
  @override
  List<Object> get props => [message];
}

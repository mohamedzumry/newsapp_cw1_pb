part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsByCategory extends CategoryEvent {
  final String category;
  const LoadNewsByCategory(this.category);

  @override
  List<Object> get props => [category];
}

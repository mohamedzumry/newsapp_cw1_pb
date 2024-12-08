import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsapp_cw1_pb/core/data/repositories/news_repository_impl.dart';
import 'package:newsapp_cw1_pb/core/domain/entities/news.dart';
import 'package:newsapp_cw1_pb/core/domain/repositories/news_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  NewsRepository newsRepository = NewsRepositoryImpl();
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) {});
    on<LoadNewsByCategory>(loadNewsByCategory);
  }

  FutureOr<void> loadNewsByCategory(
      LoadNewsByCategory event, Emitter<CategoryState> emit) async {
    emit(const CategoryPageLoadingState());
    try {
      final news = await newsRepository.getNewsByCategory(event.category);
      emit(CategoryPageLoadedState(news: news, category: event.category));
    } catch (e) {
      emit(CategoryPageLoadingErrorState(e.toString()));
    }
  }
}

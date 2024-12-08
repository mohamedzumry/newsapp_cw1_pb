import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsapp_cw1_pb/core/data/repositories/news_repository_impl.dart';
import 'package:newsapp_cw1_pb/core/domain/entities/news.dart';
import 'package:newsapp_cw1_pb/core/domain/repositories/news_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  NewsRepository newsRepository = NewsRepositoryImpl();

  void search(String query, String sortBy) {
    emit(const SearchLoading());
    try {
      newsRepository.getNewsByQuery(query, sortBy).then((news) {
        emit(SearchLoaded(news: news, query: query));
      });
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}

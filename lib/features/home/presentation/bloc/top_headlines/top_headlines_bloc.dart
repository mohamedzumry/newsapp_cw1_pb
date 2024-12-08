import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsapp_cw1_pb/core/data/repositories/news_repository_impl.dart';
import 'package:newsapp_cw1_pb/core/domain/entities/news.dart';
import 'package:newsapp_cw1_pb/core/domain/repositories/news_repository.dart';

part 'top_headlines_event.dart';
part 'top_headlines_state.dart';

class TopHeadlinesBloc extends Bloc<TopHeadlinesEvent, TopHeadlinesState> {
  final NewsRepository newsRepository = NewsRepositoryImpl();

  TopHeadlinesBloc() : super(TopHeadlinesInitial()) {
    on<TopHeadlinesEvent>((event, emit) {});
    on<LoadTopHeadlinesEvent>((event, emit) async {
      emit(TopHeadlinesLoading());
      try {
        final topHeadlines = await newsRepository.getTopHeadlines();
        emit(TopHeadlinesLoadedState(topHeadlines: topHeadlines));
      } catch (e) {
        emit(TopHeadlinesError(message: e.toString()));
      }
    });
  }
}

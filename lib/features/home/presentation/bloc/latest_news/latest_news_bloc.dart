import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsapp_cw1_pb/core/data/repositories/news_repository_impl.dart';
import 'package:newsapp_cw1_pb/core/domain/entities/news.dart';
import 'package:newsapp_cw1_pb/core/domain/repositories/news_repository.dart';

part 'latest_news_event.dart';
part 'latest_news_state.dart';

class LatestNewsBloc extends Bloc<LatestNewsEvent, LatestNewsState> {
  final NewsRepository newsRepository = NewsRepositoryImpl();

  LatestNewsBloc() : super(LatestNewsInitial()) {
    on<LatestNewsEvent>((event, emit) {});

    on<LoadLatestNewsEvent>((event, emit) async {
      emit(const LatestNewsLoading());
      try {
        final latestNews = await newsRepository.getLatestNews();
        emit(LatestNewsLoadedState(latestNews: latestNews));
      } catch (e) {
        emit(LatestNewsError(message: e.toString()));
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'main_bnb_state.dart';

class MainBnbCubit extends Cubit<MainBnbState> {
  MainBnbCubit() : super(const MainBnbInitial());

  void changeTab(int index) {
    emit(MainBnbTabChanged(currentIndex: index));
  }

  // void search() => emit(const SearchState());

  void startSearch(int oldIndex) =>
      emit(SearchBarState(isSearching: true, oldIndex: oldIndex));
  void stopSearch(int oldIndex) =>
      emit(SearchBarState(isSearching: false, oldIndex: oldIndex));
}

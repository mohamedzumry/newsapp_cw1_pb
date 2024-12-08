import 'package:equatable/equatable.dart';

abstract class MainBnbState extends Equatable {
  const MainBnbState();

  @override
  List<Object> get props => [];
}

class MainBnbInitial extends MainBnbState {
  const MainBnbInitial();
}

class MainBnbTabChanged extends MainBnbState {
  final int currentIndex;

  const MainBnbTabChanged({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

class SearchBarState extends MainBnbState {
  final bool isSearching;
  final int oldIndex;
  const SearchBarState({required this.isSearching, required this.oldIndex});

  @override
  List<Object> get props => [isSearching, oldIndex];
}

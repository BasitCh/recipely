part of 'search_bloc.dart';

class SearchState {}

class InitialState extends SearchState {}

class LoadingFood extends SearchState {}

class FoodLoaded extends SearchState {
  FoodLoaded({required this.food});
  final List<Food> food;
}

class ErrorLoadingFood extends SearchState {

  ErrorLoadingFood({required this.error});
  final String error;
}

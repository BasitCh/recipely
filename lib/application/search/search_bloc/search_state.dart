part of 'search_bloc.dart';

class SearchState {}

class InitialState extends SearchState {}

class LoadingFood extends SearchState {}

class FoodLoaded extends SearchState {
  final List<Food> food;
  FoodLoaded({required this.food});
}

class ErrorLoadingFood extends SearchState {
  final String error;

  ErrorLoadingFood({required this.error});
}

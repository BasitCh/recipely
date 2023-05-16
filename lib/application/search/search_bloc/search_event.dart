part of 'search_bloc.dart';

class SearchEvent {}

class GetFood extends SearchEvent {}

class SearchTextChanged extends SearchEvent {

  SearchTextChanged({required this.query});
  final String query;
}

class GetFilteredFoodItems extends SearchEvent {

  GetFilteredFoodItems({this.selectedCategories, this.selectedCusines});
  final List<Category>? selectedCategories;
  final List<Cusine>? selectedCusines;
}

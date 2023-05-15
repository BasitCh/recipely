part of 'categories_bloc.dart';

class CategoriesState {}

class InitialState extends CategoriesState {}

class LoadingCategories extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Category> categories;
  CategoriesLoaded({required this.categories});
}

class ErrorLoadingCategories extends CategoriesState {
  final String error;
  ErrorLoadingCategories({required this.error});
}

part of 'categories_bloc.dart';

class CategoriesState {}

class InitialState extends CategoriesState {}

class LoadingCategories extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  CategoriesLoaded({required this.categories});
  final List<Category> categories;
}

class ErrorLoadingCategories extends CategoriesState {
  ErrorLoadingCategories({required this.error});
  final String error;
}

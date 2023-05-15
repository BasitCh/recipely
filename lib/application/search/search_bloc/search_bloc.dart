// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recipely/domain/search/category.dart';
import 'package:recipely/domain/search/cusine.dart';
import 'package:recipely/domain/search/food.dart';
import 'package:recipely/infrastructure/search/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  List<Food> foodList = [];

  SearchBloc({required this.searchRepository}) : super(InitialState()) {
    on<GetFood>(_onGetFood);
    on<SearchTextChanged>(_onSearchTextChanged);
    on<GetFilteredFoodItems>(_onFilterChanged);
  }

  Future<void> _onGetFood(
    GetFood event,
    Emitter<SearchState> emit,
  ) async {
    emit(LoadingFood());
    Future.delayed(const Duration(seconds: 3), () {});
    final response = searchRepository.getFood();
    response.fold(
      (Exception failure) => emit(
        ErrorLoadingFood(
          error: failure.toString(),
        ),
      ),
      (List<Food> food) {
        foodList = food;
        emit(FoodLoaded(food: food));
      },
    );
  }

  void _onSearchTextChanged(
    SearchTextChanged event,
    Emitter<SearchState> emit,
  ) {
    final filteredItems = foodList
        .where((item) =>
            item.name.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
    emit(FoodLoaded(food: filteredItems));
  }

  void _onFilterChanged(
    GetFilteredFoodItems event,
    Emitter<SearchState> emit,
  ) {
    List<Food> filteredFood = [];
    if (event.selectedCategories!.isNotEmpty) {
      for (Category category in event.selectedCategories!) {
        final categoryBasedFoodItems = foodList
            .where((element) => element.categoryId == category.id)
            .toList();
        filteredFood.addAll(categoryBasedFoodItems);
      }
    } else if (event.selectedCusines!.isNotEmpty) {
      for (Cusine cusine in event.selectedCusines!) {
        final cusineBasedFoodItems =
            foodList.where((element) => element.cusineId == cusine.id).toList();
        filteredFood.addAll(cusineBasedFoodItems);
      }
    }

    emit(FoodLoaded(food: filteredFood));
  }
}

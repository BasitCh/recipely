// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recipely/infrastructure/search/search_repository.dart';
import '../../domain/search/food.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  List<Food> foodList = [];

  SearchBloc({required this.searchRepository}) : super(InitialState()) {
    on<GetFood>(_onGetFood);
    on<SearchTextChanged>(_onSearchTextChanged);
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
}

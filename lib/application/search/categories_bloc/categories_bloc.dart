// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:recipely/domain/search/category.dart';
import 'package:recipely/infrastructure/search/search_repository.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final SearchRepository searchRepository;
  CategoriesBloc({required this.searchRepository}) : super(InitialState()) {
    on<GetCategories>(_onGetCategories);
  }

  Future<void> _onGetCategories(
    GetCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(LoadingCategories());
    Future.delayed(const Duration(seconds: 3), () {});
    final response = searchRepository.getCategories();
    response.fold(
      (Exception failure) => emit(
        ErrorLoadingCategories(
          error: failure.toString(),
        ),
      ),
      (categories) {
        emit(CategoriesLoaded(categories: categories));
      },
    );
  }
}

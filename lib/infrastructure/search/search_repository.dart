// ignore_for_file: implementation_imports

import 'package:fpdart/src/either.dart';
import 'package:recipely/domain/search/category.dart';
import 'package:recipely/domain/search/cusine.dart';
import 'package:recipely/domain/search/food.dart';
import 'package:recipely/domain/search/i_search_repository.dart';
import 'package:recipely/infrastructure/search/search_data_service.dart';

class SearchRepository implements ISearchRepository {

  SearchRepository({required this.searchDataService});
  final SearchDataService searchDataService;

  @override
  Either<Exception, List<Food>> getFood() => searchDataService.getFood();

  @override
  Either<Exception, List<Category>> getCategories() =>
      searchDataService.getCategories();
  @override
  Either<Exception, List<Cusine>> getCusines() =>
      searchDataService.getCusines();
}

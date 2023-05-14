// ignore_for_file: implementation_imports

import 'package:fpdart/src/either.dart';
import 'package:recipely/domain/search/food.dart';
import 'package:recipely/domain/search/i_search_repository.dart';
import 'package:recipely/infrastructure/search/search_data_service.dart';

class SearchRepository implements ISearchRepository {
  final SearchDataService searchDataService;

  SearchRepository({required this.searchDataService});

  @override
  Either<Exception, List<Food>> getFood() => searchDataService.getFood();
}

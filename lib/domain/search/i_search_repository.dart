import 'package:fpdart/fpdart.dart';
import 'package:recipely/domain/search/category.dart';
import 'package:recipely/domain/search/cusine.dart';
import 'package:recipely/domain/search/food.dart';

abstract class ISearchRepository {
  Either<Exception, List<Food>> getFood();

  Either<Exception, List<Category>> getCategories();

  Either<Exception, List<Cusine>> getCusines();
}

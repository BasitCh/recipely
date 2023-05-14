import 'package:fpdart/fpdart.dart';
import 'package:recipely/domain/search/food.dart';

abstract class ISearchRepository {
  Either<Exception, List<Food>> getFood();
}

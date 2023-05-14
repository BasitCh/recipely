// ignore_for_file: implementation_imports

import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:recipely/domain/search/category.dart';
import 'package:recipely/domain/search/cusine.dart';
import 'package:recipely/domain/search/food.dart';
import 'package:recipely/domain/search/i_search_repository.dart';

@LazySingleton(as: ISearchRepository)
class SearchDataService implements ISearchRepository {
  @override
  Either<Exception, List<Food>> getFood() {
    try {
      return right(food);
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }
}

final categories = [
  Category(id: '1', name: 'Breakfast'),
  Category(id: '2', name: 'Lunch'),
  Category(id: '3', name: 'Dinner'),
];

final cusines = [
  Cusine(
    id: '1',
    name: 'Italian',
  ),
  Cusine(
    id: '2',
    name: 'Mediterranean',
  ),
  Cusine(
    id: '3',
    name: 'Chinese',
  ),
  Cusine(
    id: '4',
    name: 'English',
  ),
  Cusine(
    id: '5',
    name: 'French',
  ),
  Cusine(
    id: '6',
    name: 'Mexican',
  )
];

final food = [
  // Italian items
  Food(
      id: '1',
      name: 'Italian BreakFast',
      categoryId: '1',
      cusineId: '1',
      chef: 'John'),
  Food(
      id: '2',
      name: 'Italian Lunch',
      categoryId: '2',
      cusineId: '1',
      chef: 'John'),
  Food(
      id: '3',
      name: 'Italian Dinner',
      categoryId: '3',
      cusineId: '1',
      chef: 'John'),
  // Mediterranean items
  Food(
      id: '4',
      name: 'Mediterranean BreakFast',
      categoryId: '1',
      cusineId: '2',
      chef: 'John'),
  Food(
      id: '5',
      name: 'Mediterranean Lunch',
      categoryId: '2',
      cusineId: '2',
      chef: 'John'),
  Food(
      id: '6',
      name: 'Mediterranean Dinner',
      categoryId: '3',
      cusineId: '2',
      chef: 'John'),
  // Chinease items
  Food(
      id: '7',
      name: 'Chinease BreakFast',
      categoryId: '1',
      cusineId: '3',
      chef: 'John'),
  Food(
      id: '8',
      name: 'Chinease Lunch',
      categoryId: '2',
      cusineId: '3',
      chef: 'John'),
  Food(
      id: '9',
      name: 'Chinease Dinner',
      categoryId: '3',
      cusineId: '3',
      chef: 'John'),
  // English Items
  Food(
      id: '10',
      name: 'English BreakFast',
      categoryId: '1',
      cusineId: '4',
      chef: 'John'),
  Food(
      id: '11',
      name: 'English Lunch',
      categoryId: '2',
      cusineId: '4',
      chef: 'John'),
  Food(
      id: '12',
      name: 'English Dinner',
      categoryId: '3',
      cusineId: '4',
      chef: 'John'),
  // French Items
  Food(
      id: '13',
      name: 'French BreakFast',
      categoryId: '1',
      cusineId: '5',
      chef: 'John'),
  Food(
      id: '14',
      name: 'French Lunch',
      categoryId: '2',
      cusineId: '5',
      chef: 'John'),
  Food(
      id: '15',
      name: 'French Dinner',
      categoryId: '3',
      cusineId: '5',
      chef: 'John'),
  // Mexican
  Food(
      id: '16',
      name: 'Mexican BreakFast',
      categoryId: '1',
      cusineId: '6',
      chef: 'John'),
  Food(
      id: '17',
      name: 'Mexican Lunch',
      categoryId: '2',
      cusineId: '6',
      chef: 'John'),
  Food(
      id: '18',
      name: 'Mexican Dinner',
      categoryId: '3',
      cusineId: '6',
      chef: 'John'),
];

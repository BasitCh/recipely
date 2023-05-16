import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';
import 'package:recipely/application/search/search_bloc/search_bloc.dart';
import 'package:recipely/domain/search/food.dart';
import 'package:recipely/infrastructure/search/search_data_service.dart';
import 'package:recipely/infrastructure/search/search_repository.dart';

class MockSearchRepository extends Mock implements SearchRepository {
  @override
  Either<Exception, List<Food>> getFood() {
    try {
      return right(food);
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }
}

void main() async {
  late MockSearchRepository searchRepository;
  setUpAll(() async {
    searchRepository = MockSearchRepository();
  });

  group('Search Bloc', () {
    late SearchBloc searchBloc;
    setUp(() {
      searchBloc = SearchBloc(searchRepository: searchRepository);
    });

    blocTest<SearchBloc, SearchState>(
      'Should get food items',
      act: (bloc) => bloc.add(
        GetFood(),
      ),
      build: () => searchBloc,
      expect: () => [
        LoadingFood(),
        FoodLoaded(food: food),
      ],
    );

    tearDown(
      () => searchBloc.close(),
    );
  });
}

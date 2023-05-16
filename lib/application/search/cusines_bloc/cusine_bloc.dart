// ignore_for_file: depend_on_referenced_packages, cascade_invocations

import 'package:bloc/bloc.dart';
import 'package:recipely/domain/search/cusine.dart';
import 'package:recipely/infrastructure/search/search_repository.dart';
part 'cusine_event.dart';
part 'cusine_state.dart';

class CusinesBloc extends Bloc<CusineEvent, CusineState> {
  CusinesBloc({required this.searchRepository}) : super(InitialState()) {
    on<GetCusines>(_onGetCusines);
  }
  final SearchRepository searchRepository;

  Future<void> _onGetCusines(
    GetCusines event,
    Emitter<CusineState> emit,
  ) async {
    emit(LoadingCusines());
    Future.delayed(const Duration(seconds: 3), () {});
    final response = searchRepository.getCusines();
    response.fold(
      (Exception failure) => emit(
        ErrorLoadingCusines(
          error: failure.toString(),
        ),
      ),
      (cusines) {
        emit(CusinesLoaded(cusines: cusines));
      },
    );
  }
}

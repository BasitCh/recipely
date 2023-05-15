import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/domain/search/cusine.dart';

class CusinesCubit extends Cubit<List<Cusine>> {
  CusinesCubit(this.selectedCusines) : super(selectedCusines);

  List<Cusine> selectedCusines = [];

  void selectUnselectCusine(Cusine cusine) {
    if (selectedCusines.contains(cusine)) {
      selectedCusines.remove(cusine);
    } else {
      selectedCusines.add(cusine);
    }
    emit([
      ...selectedCusines,
    ]);
  }

  void clearCusines() {
    selectedCusines.clear();
    emit([...selectedCusines]);
  }
}

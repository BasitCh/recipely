import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/domain/search/category.dart';

class CategoriesCubit extends Cubit<List<Category>> {
  CategoriesCubit(this.selectedCategories) : super(selectedCategories);

  List<Category> selectedCategories = [];

  void selectUnselectCategories(Category category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    emit([...selectedCategories]);
  }

  void clearCategories() {
    selectedCategories.clear();
    emit([...selectedCategories]);
  }
}

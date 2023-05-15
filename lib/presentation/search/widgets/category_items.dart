import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/application/search/categories_bloc/categories_bloc.dart';
import 'package:recipely/application/search/filters_cubit/categories_cubit.dart';
import 'package:recipely/domain/search/category.dart';
import 'package:recipely/shared/extensions/number_extensions.dart';
import 'package:recipely/shared/widgets/standard_text.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(builder: (context, fState) {
      return fState is LoadingCategories || fState is ErrorLoadingCategories
          ? const SizedBox.shrink()
          : fState is CategoriesLoaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    25.verticalGap,
                    StandardText.headline5(context, 'Category'),
                    10.verticalGap,
                    BlocBuilder<CategoriesCubit, List<Category>>(
                        builder: (_, List<Category> selectedCategories) {
                      return Wrap(
                        children: [
                          ...List.generate(
                            fState.categories.length,
                            (index) => GestureDetector(
                              onTap: () {
                                context
                                    .read<CategoriesCubit>()
                                    .selectUnselectCategories(
                                        fState.categories[index]);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: selectedCategories
                                          .contains(fState.categories[index])
                                      ? Colors.teal.shade200
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: StandardText.body2(
                                  context,
                                  fState.categories[index].name,
                                  color: selectedCategories
                                          .contains(fState.categories[index])
                                      ? Colors.white
                                      : Colors.teal.shade200,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                    25.verticalGap,
                  ],
                )
              : const SizedBox.shrink();
    });
  }
}

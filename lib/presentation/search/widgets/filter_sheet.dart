import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/application/search/filters_cubit/categories_cubit.dart';
import 'package:recipely/application/search/filters_cubit/cusines_cubit.dart';
import 'package:recipely/application/search/search_bloc/search_bloc.dart';
import 'package:recipely/domain/search/category.dart';
import 'package:recipely/domain/search/cusine.dart';
import 'package:recipely/infrastructure/di/injectable.dart';
import 'package:recipely/infrastructure/search/search_data_service.dart';
import 'package:recipely/infrastructure/services/navigation_service.dart';
import 'package:recipely/shared/extensions/media_query.dart';
import 'package:recipely/shared/extensions/number_extensions.dart';
import 'package:recipely/shared/widgets/app_button_widget.dart';
import 'package:recipely/shared/widgets/standard_text.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.verticalGap,
            Center(
              child: StandardText.headline3(
                context,
                'Filter',
                align: TextAlign.center,
              ),
            ),
            25.verticalGap,
            StandardText.headline5(context, 'Category'),
            10.verticalGap,
            BlocBuilder<CategoriesCubit, List<Category>>(
                builder: (_, List<Category> selectedCategories) {
              return Wrap(
                children: [
                  ...List.generate(
                    categories.length,
                    (index) => GestureDetector(
                      onTap: () {
                        context
                            .read<CategoriesCubit>()
                            .selectUnselectCategories(categories[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: selectedCategories.contains(categories[index])
                              ? Colors.teal.shade200
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: StandardText.body2(
                          context,
                          categories[index].name,
                          color: selectedCategories.contains(categories[index])
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
            StandardText.headline5(context, 'Receipe type'),
            10.verticalGap,
            BlocBuilder<CusinesCubit, List<Cusine>>(
                builder: (_, List<Cusine> selectedCusines) {
              return Wrap(
                children: [
                  ...List.generate(
                    cusines.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          context
                              .read<CusinesCubit>()
                              .selectUnselectCusine(cusines[index]);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: selectedCusines.contains(cusines[index])
                              ? Colors.teal.shade200
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: StandardText.body2(
                          context,
                          cusines[index].name,
                          color: selectedCusines.contains(cusines[index])
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
            AppButton(
              width: context.width,
              text: 'Apply filter',
              color: Colors.teal.shade200,
              radius: 10,
              onPressed: () {
                context.read<SearchBloc>().add(
                      GetFilteredFoodItems(
                          selectedCategories: context
                              .read<CategoriesCubit>()
                              .selectedCategories,
                          selectedCusines:
                              context.read<CusinesCubit>().selectedCusines),
                    );
                getIt<NavigationService>().navigateBack(context: context);
              },
            ),
            15.verticalGap,
            Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    context.read<CategoriesCubit>().clearCategories();
                    context.read<CusinesCubit>().clearCusines();
                    context.read<SearchBloc>().add(GetFood());
                    getIt<NavigationService>().navigateBack(context: context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StandardText.button(
                    'Clear Filter',
                    color: Colors.teal.shade200,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

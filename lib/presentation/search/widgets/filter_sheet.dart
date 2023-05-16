import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/application/search/categories_bloc/categories_bloc.dart';
import 'package:recipely/application/search/cusines_bloc/cusine_bloc.dart';
import 'package:recipely/application/search/filters_cubit/categories_cubit.dart';
import 'package:recipely/application/search/filters_cubit/cusines_cubit.dart';
import 'package:recipely/application/search/search_bloc/search_bloc.dart';
import 'package:recipely/infrastructure/di/injectable.dart';
import 'package:recipely/infrastructure/services/navigation_service.dart';
import 'package:recipely/presentation/search/widgets/category_items.dart';
import 'package:recipely/presentation/search/widgets/cusine_items.dart';
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
  void initState() {
    context.read<CategoriesBloc>().add(GetCategories());
    context.read<CusinesBloc>().add(GetCusines());
    super.initState();
  }

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
                'Filter',
              ),
            ),
            const CategoryItems(),
            StandardText.headline5('Receipe type'),
            10.verticalGap,
            const CusineItems(),
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
                              context.read<CusinesCubit>().selectedCusines,),
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
                  padding: const EdgeInsets.all(8),
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

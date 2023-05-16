import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/application/search/cusines_bloc/cusine_bloc.dart';
import 'package:recipely/application/search/filters_cubit/cusines_cubit.dart';
import 'package:recipely/domain/search/cusine.dart';
import 'package:recipely/shared/widgets/standard_text.dart';

class CusineItems extends StatelessWidget {
  const CusineItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CusinesBloc, CusineState>(builder: (context, fState) {
      return fState is LoadingCusines || fState is ErrorLoadingCusines
          ? const SizedBox.shrink()
          : fState is CusinesLoaded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<CusinesCubit, List<Cusine>>(
                        builder: (_, List<Cusine> selectedCusines) {
                      return Wrap(
                        children: [
                          ...List.generate(
                            fState.cusines.length,
                            (index) => GestureDetector(
                              onTap: () {
                                context
                                    .read<CusinesCubit>()
                                    .selectUnselectCusine(
                                        fState.cusines[index],);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: selectedCusines
                                          .contains(fState.cusines[index])
                                      ? Colors.teal.shade200
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15,),
                                child: StandardText.body2(
                                  fState.cusines[index].name,
                                  color: selectedCusines
                                          .contains(fState.cusines[index])
                                      ? Colors.white
                                      : Colors.teal.shade200,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },),
                  ],
                )
              : const SizedBox.shrink();
    },);
  }
}

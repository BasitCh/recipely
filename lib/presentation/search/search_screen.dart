import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/application/search_bloc/search_bloc.dart';
import 'package:recipely/presentation/search/widgets/filter_sheet.dart';
import 'package:recipely/shared/extensions/number_extensions.dart';
import 'package:recipely/shared/widgets/standard_text.dart';
import 'package:recipely/shared/widgets/standard_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    context.read<SearchBloc>().add(GetFood());
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: const Text(
            'Search',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return (state is LoadingFood)
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : (state is ErrorLoadingFood)
                    ? Center(
                        child: StandardText.body2(
                          context,
                          state.error,
                          color: Colors.red,
                        ),
                      )
                    : (state is FoodLoaded)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: CustomScrollView(
                              slivers: [
                                SliverAppBar(
                                    pinned: true,
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    flexibleSpace: Row(
                                      children: [
                                        Flexible(
                                          child: StandardTextField(
                                            controller: searchController,
                                            key: const Key('search_field'),
                                            textInputAction:
                                                TextInputAction.done,
                                            inputFormatter: [
                                              NoLeadingSpaceFormatter()
                                            ],
                                            prefixWidget:
                                                const Icon(Icons.search),
                                            inputBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5.0),
                                              ),
                                            ),
                                            hintText: 'Search ...',
                                            onChanged: (value) => context
                                                .read<SearchBloc>()
                                                .add(SearchTextChanged(
                                                    query: value)),
                                          ),
                                        ),
                                        10.horizontalGap,
                                        Container(
                                          width: 60,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.teal.shade200,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.filter_alt_outlined,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    25.0)),
                                                  ),
                                                  backgroundColor: Colors.white,
                                                  builder: (context) {
                                                    return const FilterSheet();
                                                  });
                                            },
                                          ),
                                        )
                                      ],
                                    )),
                                SliverList.builder(
                                    itemCount: state.food.length,
                                    itemBuilder: (context, index) {
                                      final food = state.food[index];
                                      return Card(
                                        child: ListTile(
                                          leading: const Icon(
                                            Icons.flutter_dash_rounded,
                                            size: 30,
                                          ),
                                          title: StandardText.headline4(
                                            context,
                                            food.name,
                                            align: TextAlign.start,
                                          ),
                                          subtitle: StandardText.body2(
                                            context,
                                            food.chef,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      );
                                    })
                              ],
                            ),
                          )
                        : const SizedBox.shrink();
          },
        ));
  }
}

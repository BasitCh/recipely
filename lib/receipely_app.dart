// ignore_for_file: always_specify_types
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipely/application/login/login_bloc.dart';
import 'package:recipely/application/search/categories_bloc/categories_bloc.dart';
import 'package:recipely/application/search/cusines_bloc/cusine_bloc.dart';
import 'package:recipely/application/search/filters_cubit/categories_cubit.dart';
import 'package:recipely/application/search/filters_cubit/cusines_cubit.dart';
import 'package:recipely/application/search/search_bloc/search_bloc.dart';
import 'package:recipely/domain/auth/i_auth_repository.dart';
import 'package:recipely/infrastructure/di/injectable.dart';
import 'package:recipely/infrastructure/login/login_repository.dart';
import 'package:recipely/infrastructure/search/search_data_service.dart';
import 'package:recipely/infrastructure/search/search_repository.dart';

import 'presentation/delegates/gorouter_delegate.dart';

class ReceipelyApp extends StatefulWidget {
  const ReceipelyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<ReceipelyApp> createState() => _ReceipelyAppState();
}

class _ReceipelyAppState extends State<ReceipelyApp> {
  late LoginRepository _loginRepository;
  late SearchRepository _searchRepository;

  @override
  void initState() {
    super.initState();
    initRepositories();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initRepositories() {
    _loginRepository = LoginRepository(
      iAuthRepository: getIt<IAuthRepository>(),
    );
    _searchRepository =
        SearchRepository(searchDataService: getIt<SearchDataService>());
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) => _loginRepository,
        ),
        RepositoryProvider(
          create: (BuildContext context) => _searchRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (BuildContext context) =>
                LoginBloc(loginRepository: _loginRepository),
          ),
          BlocProvider<SearchBloc>(
            create: ((context) =>
                SearchBloc(searchRepository: _searchRepository)),
          ),
          BlocProvider<CategoriesBloc>(
            create: ((context) =>
                CategoriesBloc(searchRepository: _searchRepository)),
          ),
          BlocProvider<CusinesBloc>(
            create: ((context) =>
                CusinesBloc(searchRepository: _searchRepository)),
          ),
          BlocProvider(create: (context) => CategoriesCubit([])),
          BlocProvider(create: (context) => CusinesCubit([]))
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: GoRouterDelegate.routerConfig,
          builder: (BuildContext context, Widget? child) =>
              AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
              systemNavigationBarColor: Colors.blue,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1,
                ),
                child: Stack(
                  children: [
                    child ?? Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

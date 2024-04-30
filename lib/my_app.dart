import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/dependency_injection/get_it_stetup.dart';
import 'package:movies/core/router/app_routers.dart';
import 'package:movies/core/utils/app/app_colors.dart';
import 'package:movies/features/home/domain/repos/home_repo.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>())..getMovies(),
      child: MaterialApp.router(
        title: 'Movies',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColorBlue),
          useMaterial3: true,
        ),
        routerConfig: screensRouter,
      ),
    );
  }
}

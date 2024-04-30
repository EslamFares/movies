import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/router/my_routes.dart';
import 'package:movies/features/home/data/functions/movie_index.dart';
import 'package:movies/features/home/presentation/view/home_view.dart';
import 'package:movies/features/home/presentation/view/movie_details_view.dart';
import 'package:movies/features/splash/presentation/views/splash_view.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter screensRouter = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: MyRoutes.splash,
    routes: [
      GoRoute(
          path: MyRoutes.splash,
          builder: (context, state) => const SplashView()),
      GoRoute(
          path: "/",
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
                path: 'details/:movieId',
                builder: (context, state) {
                  if (kDebugMode) {
                    print('Deep link opened: path=${state.pathParameters}');
                  }
                  return MovieDetailsView(
                      movieId: movieIndex(state.pathParameters['movieId']));
                }),
          ]),
      GoRoute(
          path: MyRoutes.home, builder: (context, state) => const HomeView()),
      GoRoute(
          path: MyRoutes.movieDetailsView,
          builder: (context, state) =>
              MovieDetailsView(movieId: movieIndex(state.extra?.toString()))),
    ]);

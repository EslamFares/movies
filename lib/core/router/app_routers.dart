import 'package:go_router/go_router.dart';
import 'package:movies/core/router/my_routes.dart';
import 'package:movies/features/home/presentation/view/home_view.dart';
import 'package:movies/features/home/presentation/view/movie_details_view.dart';

final GoRouter screensRouter = GoRouter(routes: [
  // GoRoute(path: "/", builder: (context, state) => const SplashView()),
  GoRoute(path: "/", builder: (context, state) => const HomeView()),
  GoRoute(
      path: MyRoutes.movieDetailsView,
      builder: (context, state) => MovieDetailsView(
            movieId: int.parse(state.extra?.toString() ?? "-1"),
          )),
]);

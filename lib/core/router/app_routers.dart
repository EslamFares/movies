import 'package:go_router/go_router.dart';
import 'package:movies/features/home/presentation/view/home_view.dart';

final GoRouter screensRouter = GoRouter(routes: [
  // GoRoute(path: "/", builder: (context, state) => const SplashView()),
  GoRoute(path: "/", builder: (context, state) => const HomeView()),
]);

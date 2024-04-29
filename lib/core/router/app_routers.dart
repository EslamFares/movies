import 'package:go_router/go_router.dart';
import 'package:movies/features/home/presentation/view/home_view.dart';

abstract class AppRouters {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
      GoRoute(path: '/details', builder: (context, state) => const HomeView()),
    ],
  );
}

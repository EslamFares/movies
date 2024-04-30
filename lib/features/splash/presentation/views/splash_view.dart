import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/router/my_routes.dart';
import 'package:movies/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),
        () => GoRouter.of(context).pushReplacement(MyRoutes.home));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}

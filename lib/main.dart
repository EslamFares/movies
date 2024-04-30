import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/fb_notification/fb_notification.dart';
import 'package:movies/core/fb_notification/main_fb_fun.dart';
import 'package:movies/core/functions/mybloc_observer.dart';
import 'package:movies/core/router/app_routers.dart';
import 'package:movies/core/utils/app/app_colors.dart';
import 'package:movies/features/home/domain/repos/home_repo.dart';
import 'package:movies/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:movies/firebase_options.dart';
import 'core/dependency_injection/get_it_stetup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // bg & fg  initalize
  FbPushNotifications.init();
  FbPushNotifications.fbForegroundlocalNotificationInit();
  //on tap background notiication
  onTapBackgroundNotification();
  //listen to background noitifcation
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageListen);
  // handel foreground notification
  onTapForegroundNotification();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(const MyApp());
}

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>())..getMovies(),
      child: MaterialApp.router(
        // navigatorKey: navigatorKey,

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

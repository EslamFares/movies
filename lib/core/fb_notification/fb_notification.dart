import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:movies/core/router/app_routers.dart';
import 'package:movies/features/home/data/functions/movie_index.dart';
import 'package:movies/features/home/presentation/view/movie_details_view.dart';

class FbPushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;

  //#request notification permission
  static Future init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    //get phone fcm token for test
    // ignore: unused_local_variable
    final token = await _firebaseMessaging.getToken();
    // debugPrint('token: $token');
  }

  //#========================local for foreground notifications=========================
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // initalize local notifications
  static Future fbForegroundlocalNotificationInit() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher'); //launcher_icon
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }

  // on tap local notification in foreground
  static void onNotificationTap(NotificationResponse notificationResponse) {
    debugPrint('notificationResponse: ${notificationResponse.payload}');
    var payloadData = jsonDecode(notificationResponse.payload!);
    debugPrint('payloadData: $payloadData');

    if (movieIndex(payloadData['id']) != -1) {
      navigatorKey.currentState?.push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                MovieDetailsView(movieId: int.parse(payloadData['id']))),
      );
    }

    // navigatorKey.currentState!.pushNamed("/notification", arguments: notificationResponse);
    //or to open page notifiaction
    // navigatorKey.currentState!.push(MaterialPageRoute(
    //     builder: (context) => const NotificationView(),
    //     settings: RouteSettings(arguments: notificationResponse)));
  }

  // show a simple notification
  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('movies', 'new movies',
            channelDescription: 'watch movies',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }
}

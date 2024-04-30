import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/fb_notification/fb_notification.dart';

//function to listen to bg changes

Future firebaseBackgroundMessageListen(RemoteMessage message) async {
  if (message.notification != null) {
    debugPrint('some notiiiifi recived!!!');
  }
}
//on tap background notiication

void onTapBackgroundNotification() {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      debugPrint("bg notifi Tapppped");
      // navigatorKey.currentState!.pushNamed("/notification", arguments: message);
      //or to open page notifiaction
      // navigatorKey.currentState!.push(MaterialPageRoute(
      //     builder: (context) => const NotificationView(),
      //     settings: RouteSettings(arguments: message)));
    }
  });
}

// handel foreground notification

void onTapForegroundNotification() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    debugPrint("foreground message*******");
    if (message.notification != null) {
      FbPushNotifications.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData);
      // navigatorKey.currentState!.pushNamed("/notification", arguments: message);
      //or to open page notifiaction
      // navigatorKey.currentState!.push(MaterialPageRoute(
      //     builder: (context) => const NotificationView(),
      //     settings: RouteSettings(arguments: message)));
    }
  });
}

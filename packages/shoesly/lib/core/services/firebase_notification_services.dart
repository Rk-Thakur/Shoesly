import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationServices {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    final token = await _firebaseMessaging.getToken();

    log('Firebase Detils FCM: $token');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data['title']}');
      log('Message data: ${message.data['body']}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification?.title ?? ''}');
        print('Message also contained a notification: ${message.notification?.body ?? ''}');
      }
    });
    FirebaseMessaging.onBackgroundMessage(handleBackgroudMessage);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data['title']}');
      log('Message data: ${message.data['body']}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification?.title ?? ''}');
        print('Message also contained a notification: ${message.notification?.body ?? ''}');
      }
    });
  }
}

Future<void> handleBackgroudMessage(RemoteMessage message) async {
  await Firebase.initializeApp();

  print('Handling a background message: ${message.messageId}');
  print('Handling a background message: ${message.data.toString()}');
}


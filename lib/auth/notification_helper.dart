import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_aids_app_pro1/auth/auth_helper.dart';

import 'firestore_helper.dart';

class NotificationHelper {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> init() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    print("Handling a background message: ${message.messageId}");
  }

  static sendNotificationToAllUserType({
    required UserType userType,
    required String title,
    required String body,
  }) async {
    var users = await FirestoreHelper.getFireUsers();

    for (var element in users) {
      if (element.userType == userType) {
        sendNotification(
          to: element.notificationToken,
          title: title,
          body: body,
        );
      }
    }
  }

  static sendNotification({
    required String to,
    required String title,
    required String body,
  }) async {
    var headers = {
      'Authorization':
          'key=AAAAJ_AAT3Y:APA91bGBWe9eP8uM22FsJBLn_Q-rzt9ZO9FcArpao9udnlGFNWI1lJGvpZ6p6XBhkkWKoKykuu_oO3ApSh8qKTsHf62Dan-xyRXLG85nMHIPFVJkM4eInNNPU-ufpUUOMrivzignEcd9',
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "to": to,
      "notification": {
        "android_channel_id": "ringtone1",
        "body": body,
        "OrganizationId": "2",
        "content_available": true,
        "priority": "high",
        "subtitle": "Elementary School",
        "title": title
      },
      "data": {
        "argument": {"currentC4DIndex": 1, "currentIndex": 1},
        "navigate_route": "/owner-orders",
        "priority": "high",
        "sound": "app_sound.wav",
        "content_available": true,
        "bodyText": "New Announcement assigned",
        "organization": "Elementary school"
      }
    });
    var dio = Dio();
    var response = await dio.request(
      'https://fcm.googleapis.com/fcm/send',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}

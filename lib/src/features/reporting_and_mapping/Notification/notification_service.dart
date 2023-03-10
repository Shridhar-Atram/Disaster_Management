import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import '../../../constants/keys.dart';

class NotificationService {
  NotificationService();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<void> saveTokenToFirestore(String token, String userId) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference<Map<String, dynamic>> users =
        firestore.collection('usersToken');

    try {
      await users.doc(userId).set(
        {
          'fcmToken': token,
        },
        SetOptions(merge: true),
      );
    } catch (error) {
      print('Failed to save FCM token to Firestore: $error');
    }
  }

  Future<String> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    await saveTokenToFirestore(token!, "Shridhar Atram");
    print('Device Token: $token');
    return token;
  }

  void initInfo() {
    var androidInitialize =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializationSettings =
        InitializationSettings(android: androidInitialize);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      try {
        if (payload != null && payload.isNotEmpty) {
        } else {}
      } catch (e) {
        print(e);
      }
      return;
    });

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        // Define a BigTextStyle object
        final BigTextStyleInformation bigTextStyleInformation =
            BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification!.title.toString(),
          htmlFormatContentTitle: true,
        );

        // Create a notification with the BigTextStyle object
        final AndroidNotificationDetails androidPlatformChannelSpecifics =
            AndroidNotificationDetails(
          'disaster_management',
          'disaster_management',
          'disaster_management',
          styleInformation: bigTextStyleInformation,
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
        );
        final NotificationDetails platformChannelSpecifics =
            NotificationDetails(android: androidPlatformChannelSpecifics);
        // await _flutterLocalNotificationsPlugin.show(
        //   0,
        //   message.notification?.title,
        //   message.notification?.body,
        //   platformChannelSpecifics,
        //   payload: message.data["title"],
        // );
      },
    );
  }

  Future<void> sendPushMessage(
      String token, String titleText, String body) async {
    const postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      "notification": {
        "body": body,
        "title": titleText,
        "android_channel_id": "disaster_management",
      },
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
        "title": titleText,
        "body": body,
      },
      "to": "$token"
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization': "key=${Keys.firebaseMessagingAPIKey}",
    };

    final response = await http.post(Uri.parse(postUrl),
        headers: headers, body: json.encode(data));
    if (response.statusCode == 200) {
      print('Push notification sent successfully!');
    } else {
      print('Error sending push notification');
      print(response.body);
    }
  }
}

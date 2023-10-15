// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;

// class MyNotificationFunction {
//   ////////////////////////////////////////////////////////////////////////////////
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   final AndroidInitializationSettings androidInitializationSettings =
//       AndroidInitializationSettings("@mipmap/ic_launcher");

//   //
//   void initializeNotifications() async {
//     InitializationSettings initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   // for secheduleNotification notification function
//   void secheduleNotification(String title, String body) async {
//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       "channelId",
//       "channelName",
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//     );

//     await flutterLocalNotificationsPlugin.periodicallyShow(
//       0,
//       title,
//       body,
//       RepeatInterval.everyMinute,
//       notificationDetails,
//     );
//   }

//   ////
//   ///
//   Future<bool> callOnFcmApiSendPushNotifications(
//       {@required String title, @required String body}) async {
//     // String? token = await FirebaseMessaging.instance.getToken(); // new add

//     const postUrl = 'https://fcm.googleapis.com/fcm/send'; // FCM Rest api it is
//     final data = {
//       "to": "/topics/subscribeToTopic", // This is the topic that you can assign
//       "notification": {
//         "title": title,
//         "body": body,
//       },
//       "data": {
//         "type": '0rder',
//         "id": '28',
//         "click_action": 'FLUTTER_NOTIFICATION_CLICK',
//       }
//     };

//     final headers = {
//       'content-type': 'application/json',
//       'Authorization':
//           'key=AAAAwSErO_c:APA91bGu2-ALqUqbmoO2mMrIOwgO799tRqKlGX0ThfYQBKBvr_25j_3-vVO58JlF9athDgADFRvYj9pn29wX2h9CHlZ7huNl5X996dy8UHvN4vIXO1Bmh0YcK69ZAxZJQFuKfi0cGxi_' // 'key=YOUR_SERVER_KEY' to replace here. You can get yours from firebase project's settings and then to cloud messaging tab.
//     };

//     final response = await http.post(Uri.parse(postUrl),
//         body: json.encode(data),
//         encoding: Encoding.getByName('utf-8'),
//         headers: headers);

//     if (response.statusCode == 200) {
//       print('test fine push CFM');
//       secheduleNotification(title.toString(), body.toString());
//       return true;
//     } else {
//       print('CFM error');
//       return false;
//     }
//   }
// }




// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationServices {
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

  // final AndroidInitializationSettings androidInitializationSettings =
  //     AndroidInitializationSettings("@mipmap/ic_launcher");

  // //
  // void initializeNotifications() async {
  //   InitializationSettings initializationSettings = InitializationSettings(
  //     android: androidInitializationSettings,
  //   );
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // }

  // // for secheduleNotification notification function
  // void secheduleNotification(String title, String body) async {
  //   AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails(
  //     "channelId",
  //     "channelName",
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidNotificationDetails,
  //   );

  //   await flutterLocalNotificationsPlugin.periodicallyShow(
  //     0,
  //     title,
  //     body,
  //     RepeatInterval.everyMinute,
  //     notificationDetails,
  //   );
  // }
// }

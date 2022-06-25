// import 'dart:io' show Platform;

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import '../device/domain/entities/device.dart';
// import '../error/exception.dart';

// /// Ask for push notification in mobile app
// abstract class PushNotification {
//   /// Returns firebase token of the device for cloud messaging
//   /// Other mobile device information are also gathered
//   Future<Device> device();

//   /// Initialize local notification
//   Future<void> initializeNotification();
// }

// /// Implements [PushNotification]
// class PushNotificationImpl implements PushNotification {
//   /// Constructor
//   PushNotificationImpl(this.localNotification);

//   /// local notification plugin
//   final FlutterLocalNotificationsPlugin localNotification;

//   @override
//   Future<Device> device() async {
//     final permission = await FirebaseMessaging.instance.requestPermission();
//     if (permission.authorizationStatus != AuthorizationStatus.authorized) {
//       throw DeviceException(
//           'Notification error🔔.\nEnable notification permission.');
//     }
//     final token = await FirebaseMessaging.instance.getToken();
//     return Device(fcmToken: token!, operatingSystem: Platform.operatingSystem);
//   }

//   @override
//   Future<void> initializeNotification() async {
//     const initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/launcher_icon');

//     const initializationSettingsIOS = IOSInitializationSettings();

//     const initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     await localNotification.initialize(initializationSettings);

//     const channel = AndroidNotificationChannel(
//         'app.heny.food', // id
//         'Heny', // title
//         importance: Importance.high,
//         ledColor: Colors.orange,
//         enableLights: true);

//     /// Update the iOS foreground notification presentation options to allow
//     /// heads up notifications.
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//         alert: true, badge: true, sound: true);

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       final notification = message.notification;
//       final android = message.notification?.android;
//       if (notification != null && android != null) {
//         localNotification.show(
//             message.hashCode,
//             message.notification!.title,
//             message.notification!.body,
//             NotificationDetails(
//                 android: AndroidNotificationDetails(channel.id, channel.name)));
//       }
//     });
//   }
// }

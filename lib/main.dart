// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/firebase_options.dart';
import 'package:learning/src/auth/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'site_da_lae', // id
//   'Site Da Lae Notification', // title
//   importance: Importance.high,
// );

// /// Initialize the [FlutterLocalNotificationsPlugin] package.
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// showNotificationMediaStyle(
//   String title,
//   String body,
// ) async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'site_da_lae',
//     'Site Da Lae Notification',
//     icon: "ic_stat_chat",
//   );

//   NotificationDetails platformChannelSpecifics = const NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//   );

//   await flutterLocalNotificationsPlugin.show(
//     0,
//     title,
//     body,
//     platformChannelSpecifics,
//   );
// }

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) {
//   showNotificationMediaStyle(
//     message.data['title'],
//     message.data['body'],
//   );
//   return Future.value();
// }

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.

  final settingsController = SettingsController(SettingsService());
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize();

  // Load the user's prred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  // const AndroidInitializationSettings initializationSettingsAndroid =
  //     AndroidInitializationSettings('ic_stat_chat');

  // const InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  // );

  // await flutterLocalNotificationsPlugin.initialize(
  //   initializationSettings,
  //   onDidReceiveNotificationResponse:
  //       (NotificationResponse notificationResponse) async {
  //     final prefs = await SharedPreferences.getInstance();
  //     final token = prefs.getString('token');
  //     final container = ProviderContainer();
  //     container.read(myTokenProvider.notifier).state = token ?? '';
  //     runApp(
  //       UncontrolledProviderScope(
  //         container: container,
  //         child: MyApp(settingsController: settingsController),
  //       ),
  //     );
  //   },
  // );

  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final container = ProviderContainer();
  container.read(myTokenProvider.notifier).state = token ?? '';
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(settingsController: settingsController),
    ),
  );
}

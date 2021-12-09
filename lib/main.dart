import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
//
import 'package:analyst_coin/analyst_coin.dart';
import 'package:analyst_coin/services/notificationHelper.dart';
//firebase && redux
import 'package:firebase_core/firebase_core.dart';
import 'package:analyst_coin/Redux/store.dart';
//Translate
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_translate/flutter_translate.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails notificationAppLaunchDetails;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en', supportedLocales: ['en', 'es', 'pt']);

  await Firebase.initializeApp();
  await Redux.init();

  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  await initNotifications(flutterLocalNotificationsPlugin);
  requestIOSPermissions(flutterLocalNotificationsPlugin);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(LocalizedApp(delegate, AnalystCoin())));
}

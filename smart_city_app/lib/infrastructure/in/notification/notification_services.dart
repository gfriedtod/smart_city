import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v1.dart';
import 'package:uuid/v4.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    var androidSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSettings = const DarwinInitializationSettings();
    var initSettings =
    InitializationSettings(android: androidSettings, iOS: iosSettings);

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await _notificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotification {
  // static int _id = 0;

  static final FlutterLocalNotificationsPlugin _nfp =
      FlutterLocalNotificationsPlugin();

  static initState() async {
    const AndroidInitializationSettings androidseting =
        AndroidInitializationSettings("@drawable/noti_icon");
    const DarwinInitializationSettings iosseting = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        requestCriticalPermission: true,
        onDidReceiveLocalNotification: _iosRecive);
    const InitializationSettings setings = InitializationSettings(
      android: androidseting,
      iOS: iosseting,
    );
    await _nfp.initialize(setings,
        onDidReceiveBackgroundNotificationResponse: _background,
        onDidReceiveNotificationResponse: _frontApp);
  }

  static Future<NotificationDetails> _notidetal() async {
    const AndroidNotificationDetails andital = AndroidNotificationDetails(
      "chanel id",
      "chanel name",
      channelDescription: "chanel description",
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );
    const DarwinNotificationDetails iosDetail = DarwinNotificationDetails();
    return const NotificationDetails(
      android: andital,
      iOS: iosDetail,
    );
  }

  static void _iosRecive(
      int id, String? title, String? body, String? payload) {}

  static void _background(NotificationResponse details) {}

  static void _frontApp(NotificationResponse details) {}

  static showNotification({
    int id = 0,
    required String title,
    required String body,
  }) async {
    final detail = await _notidetal();
    await _nfp.show(
      id,
      title,
      body,
      detail,
    );
  }
}

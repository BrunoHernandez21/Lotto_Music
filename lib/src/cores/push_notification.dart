import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

///
///  importante
///
///  Android
///  Para instalar el paquete primero ejecute
///  cd android && ./gradlew signingReport
///  obtenga la SHA 1 e ingresela en firebase consol
///
///

class PushNotification {
  static FirebaseMessaging instance = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _controller = StreamController();
  static Stream<String> get notificationController => _controller.stream;

  static Future<void> initializeApp() async {
    await Firebase.initializeApp();
    final a = await _requestPermision();
    if (a == false) return;
    token = await instance.getToken();
    FirebaseMessaging.onBackgroundMessage(_onBackground);
    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageAppOpen);
  }

  static Future<void> _onBackground(RemoteMessage message) async {
    _controller.add(message.notification?.title ?? "No title");
    return;
  }

  static Future<void> _onMessage(RemoteMessage message) async {
    _controller.add(message.notification?.title ?? "No title");
    return;
  }

  static Future<void> _onMessageAppOpen(RemoteMessage message) async {
    _controller.add(message.notification?.title ?? "No title");
    return;
  }

  void closeController() {
    _controller.close();
  }

  static Future<bool> _requestPermision() async {
    NotificationSettings noti = await instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (noti.authorizationStatus != AuthorizationStatus.authorized) {
      return false;
    }
    return true;
  }
}

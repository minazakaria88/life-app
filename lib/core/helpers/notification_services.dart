
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  static final localNotification = FlutterLocalNotificationsPlugin();
  static  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  static int notificationId = 0;

  static Future<void> init() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
      iOS: DarwinInitializationSettings(),
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    await localNotification.initialize(initializationSettings);
    await localNotification
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();



    // messaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
    //
    //
    // messaging.onMessage.listen((RemoteMessage message) {
    //   if (message.notification != null) {
    //     showNotification(
    //
    //       title: message.notification!.title ?? '',
    //       body: message.notification!.body ?? '',
    //       payload: message.data.toString(),
    //     );
    //   }
    // });
    //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  }



  static Future<void> showNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    await localNotification.show(
      notificationId++,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }


  static Future <String?> getDeviceToken() async {
   return await messaging.getToken();
  }

  static Future<void> onRefreshToken() async {
    messaging.onTokenRefresh.listen((token) {


    });
  }


  static Future<void> closeNotification() async {
    await localNotification.cancelAll();
  }


}






import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';


final navigatorKey = GlobalKey<NavigatorState>();

class FirebaseApi {
  //create an instance if Firebase messaging
  static final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize notifications
  Future initNotifications() async {
  //request permission from user (will prompt user)
  await _firebaseMessaging.requestPermission();

  //fetch the FCM token for this device
  final fcmToken = await _firebaseMessaging.getToken();

  //print th token (normally you would send this to your server
  log("FCMToken $fcmToken");

  // initialize further settings for push notifications
  //initPushNotifications();
}

//function to handle received messages
  /*Future handleMessage (RemoteMessage message) async {
    // if the message is null, do nothing
    if (message.notification != null) {
      print('some notification received');//return;
    }

    //navigate to new screen when message is received and users taps notification
    navigatorKey.currentState!.pushNamed(
        '/notification_page',
        arguments: message);
  }*/

//function to initialize background settings
  /*Future initPushNotifications() async {
    //handle notification if the app was terminated and now opened
    //FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
   // FirebaseMessaging.onBackgroundMessage(handleMessage);

    //attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('Background notification tapped');
      }
    });
  }*/

}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:moyo/components/moyo_button.dart';
import 'package:moyo/screens/notifications.dart';

class NotificationOnReceived extends StatefulWidget {
  const NotificationOnReceived({Key? key}) : super(key: key);

  @override
  State<NotificationOnReceived> createState() => _NotificationOnReceivedState();
}

class _NotificationOnReceivedState extends State<NotificationOnReceived> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Widget build(BuildContext context) {
    //get the notification message and display on screen
    final message = ModalRoute
        .of(context)!
        .settings
        .arguments as RemoteMessage;
    _onMessageReceived(message);
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
              color: Colors.white
          ),
          title: const Text('Senaste notisen',
            style: TextStyle(
              color: Colors.white,
            ),),
          backgroundColor: Colors.black87,
          //elevation: 0.0,
        ),
        body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/wood-plank-texture-background.jpg'),
          ),
        ),
        child: Column (
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(message.notification!.title.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,),
            const SizedBox(
              height: 20,
            ),
            Text(message.notification!.body.toString()),
            //Text(message.data.toString()),
            const SizedBox(
              height: 30,
            ),
            MoyoButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (
                              context) => const NotificationPage()));
                },
                text: 'Se alla notiser')
          ],
        )
      ),
    );
  }

  //save received notification to database
  Future<void> _onMessageReceived(RemoteMessage message) async {
    bool isNotificationExists = await checkIfNotificationExists(
        message.notification!.title.toString(),
        message.notification!.body.toString());

    if (!isNotificationExists) {
      // Save the notification if it doesn't exist
      await FirebaseFirestore.instance.collection('notifications').add({
        'title': message.notification?.title ?? '',
        'body': message.notification?.body ?? '',
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<bool> checkIfNotificationExists(String title, String body) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('notifications')
        .where('title', isEqualTo: title)
        .where('body', isEqualTo: body)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }
}


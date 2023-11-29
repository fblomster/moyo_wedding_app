import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  /*@override
  void initState() {
    super.initState();
    _configureFirebaseMessaging();
  }*/

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
          title: const Text('Notiser',
            style: TextStyle(
              color: Colors.white,
            ),),
          backgroundColor: Colors.black87,
          //elevation: 0.0,
        ),
        body: /*StreamBuilder(
          stream: FirebaseFirestore.instance.collection('notifications')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            var notifications = snapshot.data?.docs;

            return ListView.builder(
                itemCount: notifications?.length,
                itemBuilder: (context, index) {
                  var notification = notifications?[index].data();
                  return ListTile(
                    title: Text(notification?['title']),
                    subtitle: Text(notification?['body']),
                  );
                });
          },
        )*/

      Container(
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
          ],
        )
      ),
    );
  }

  void _onMessageReceived(RemoteMessage message) {
    FirebaseFirestore.instance.collection('notifications').add({
      'title': message.notification?.title ?? '',
      'body': message.notification?.body ?? '',
      'timestamp': FieldValue.serverTimestamp(),
    });
  }


  /*void _configureFirebaseMessaging() {
    _firebaseMessaging.configure(
      onMessage: _onMessageReceived,
      onLaunch: (Map<String, dynamic> message) async {
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => const NotificationPage()));
      },
      onResume: (Map<String, dynamic> message) async {
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => const NotificationPage()));
      },
    );
  }*/
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  Future<QuerySnapshot> getNotifications() {
    return FirebaseFirestore.instance
        .collection('notifications')
        .orderBy('timestamp', descending: true)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Notiser',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black87,
        //elevation: 0.0,
      ),
      body: FutureBuilder(
        future: getNotifications(), // Replace with your function to fetch data
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<QueryDocumentSnapshot> notifications = snapshot.data!.docs;

            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/wood-plank-texture-background.jpg'),
                ),
              ),
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  var notification =
                      notifications[index].data() as Map<String, dynamic>;
                  return ListTile(
                    title: Text(notification['title'] as String),
                    subtitle: Text(notification['body'] as String),
                    // Add more UI components to display additional data
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

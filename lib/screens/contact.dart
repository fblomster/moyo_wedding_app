import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  //auth instance
  final FirebaseAuth _auth =  FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Kontakt',
          style: TextStyle(
            color: Colors.white,
          ),),
        backgroundColor: Colors.black87,
        //elevation: 0.0,
      ),
      body: _buildUserList(),
      /*Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/wood-plank-texture-background.jpg'),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Kontakta oss vid frågor',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {
                    //Navigator.push(
                      //  context,
                        //MaterialPageRoute(
                          //  builder: (context) => const RSVPInsertData()));
                  },
                  child: const Text('Skicka',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),*/
    );
  }

  //building a list of users except the current logged in user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text ('Loading...');
          }

          return ListView(
            children: snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc))
            .toList(),
          );
        },
    );
  }

  //build individual user list item
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display all users except current user
  if (_auth.currentUser!.email != data['email']) {
    return ListTile(
      title: Text(data['email']),
      onTap: () {
        //pass the clicked user's uID to the chat page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverUserEmail: data['email'],
              receiverUserID: data['uid'],
        ),
        ),
        );
      },
    );
  }
  else {
    //return empty container
    return Container();
  }
  }
}
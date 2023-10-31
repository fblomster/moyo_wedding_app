import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moyo/models/message.dart';

class ChatService extends ChangeNotifier {
  //auth and firestore instances
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // send message
  Future <void> sendMessage (String receiverId, String message) async {
  //get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

  //create a new message
    Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp,
    );

    Map<String, dynamic> messageMap = newMessage.toMap();

  // construct chat room id from current user id and receiver id (sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); //sort the ids to make sure the chat room ids are always the same for any pair of names
    String chatRoomId = ids.join(
      "_"); // combine the ids into a single string to use as a chatroomID

  // add new message to database
    await _fireStore.collection('chat_rooms').doc(chatRoomId).collection('messages').add(messageMap);

  }

  //get message
  Stream<QuerySnapshot> getMessages (String userId, String otherUserId) {
    //construct chat room id from user ids (sorted to ensure it matches the id when sending
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
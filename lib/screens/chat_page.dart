import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moyo/components/chat_bubble.dart';
import 'package:moyo/components/moyo_text_field.dart';
import 'package:moyo/services/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  const ChatPage({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUserID
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  //final ScrollController _scrollController = ScrollController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    //only send the message if there is something to send
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(widget.receiverUserID, _messageController.text);

      //clear the controller after sending the message
      _messageController.clear();
    }
    else {
      print('Empty error');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
          backgroundColor: Colors.black87,
        title: Text(widget.receiverUserEmail,
        style: const TextStyle(
          color: Colors.white,
        ),
    ),
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
        child: Column(
          children: [
            //messages
              Expanded(
                child: _buildMessageList(),
              ),

            //user input
            _buildMessageInput(),

            const SizedBox(height: 25)
          ],
        )
        ),
    );
  }

  //build message list
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.receiverUserID,
            _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error${snapshot.error.toString()}');
            }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
        }

          List<Widget> messageWidgets = snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList();

          return ListView(
            //controller: _scrollController,
            children: messageWidgets,
          );
        },
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    //align the messages to the right if the sender is the current user, otherwise to the left
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
      ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisAlignment: (data['senderId'] == _firebaseAuth.currentUser!.uid)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
        Text(data['senderEmail']),
          const SizedBox(height: 5),
          ChatBubble(message: data['message'],)
        ],
      ),
    );
  }

  //build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Row(
        children: [
          //textfield
          Expanded(
              child: MoyoTextField(
                controller: _messageController,
                hintText: 'Enter message',
                obscureText: false,
          ),
          ),

          //send button
          IconButton(onPressed: sendMessage, icon: const Icon(Icons.arrow_upward)), //color: Colors.black87,)
        ],
      ),
    );
  }
}


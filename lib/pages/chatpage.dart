import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/chat_bubble.dart';
import 'package:flutter_application_1/components/textfield.dart';
import 'package:flutter_application_1/services/auth/auth_service.dart';
import 'package:flutter_application_1/services/chat/chat_service.dart';

class Chatpage extends StatefulWidget {
  final String userEmail;
  final String userId;
  Chatpage({super.key, required this.userEmail, required this.userId});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final TextEditingController messageController = TextEditingController();

  final _auth = AuthService();

  final chatService = ChatService();
  FocusNode _focusNode = FocusNode();

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(widget.userId, messageController.text);
      messageController.clear();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Future.delayed(const Duration(microseconds: 500), () => scrollDown());
      }
    });
  }

  final ScrollController myScroller = ScrollController();
  void scrollDown() {
    myScroller.animateTo(
      myScroller.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    messageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.userEmail),
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade400,
      ),
      body: Column(
        children: [Expanded(child: _buildMessageList()), _buildUserInput()],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderId = _auth.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessages(senderId, widget.userId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error loading the messages.");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Waiting for th messages..........");
        }

        return ListView(
            controller: myScroller,
            children: snapshot.data!.docs
                .map((data) => _buildMessageItem(data))
                .toList());
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderId'] == _auth.getCurrentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: ChatBubble(message: data['message'], isCurrentUser: isCurrentUser),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: MyTextfield(
              focusNode: _focusNode,
              hintText: "Type a message",
              obsecuretext: false,
              controller: messageController,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

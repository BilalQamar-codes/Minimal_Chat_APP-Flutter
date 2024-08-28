import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/usertile.dart';
import 'package:flutter_application_1/pages/chatpage.dart';
import 'package:flutter_application_1/services/auth/auth_service.dart';
import 'package:flutter_application_1/components/drawer.dart';
import 'package:flutter_application_1/services/chat/chat_service.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final authService = AuthService();
  final _chatService = ChatService();

  void logout() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: _buildUsers(context),
    );
  }

  Widget _buildUsers(BuildContext context) {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("There is an error loading the users!");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading.......");
        }

        return ListView(
          scrollDirection: Axis.vertical,
          children: snapshot.data!
              .map<Widget>((userData) => _buildUsersListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUsersListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != authService.getCurrentUser()!.email) {
      return Usertile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chatpage(
                userEmail: userData['email'],
                userId: userData['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}

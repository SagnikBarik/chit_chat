import 'package:chit_chat/components/user_tile.dart';
import 'package:chit_chat/screens/chat_screen.dart';
import 'package:chit_chat/services/auth/auth_service.dart';
import 'package:chit_chat/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

import 'package:chit_chat/components/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }
          return ListView(
              children: snapshot.data!
                  .map<Widget>((userData) => _buildUserListItem(userData, context))
                  .toList());
        });
  }
}

Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
  return UserTile(
    text: userData['name'],
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatScreen(
            reciever: userData['name'],
          ),
        ),
      );
    },
  );
}

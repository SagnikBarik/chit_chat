import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String reciever;
  const ChatScreen({
    super.key,
    required this.reciever,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(reciever),
      ),
    );
  }
}

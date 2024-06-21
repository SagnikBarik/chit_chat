import 'package:chit_chat/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.green.shade600 : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(15),
      margin: isCurrentUser ? const EdgeInsets.fromLTRB(100,4,15,4) : const EdgeInsets.fromLTRB(15,4,100,4),
      child: Text(
        message,
        style: TextStyle(
          color: isCurrentUser ? Colors.white : (isDarkMode ? Colors.grey.shade200 : Colors.grey.shade800),
        ),
      ),
    );
  }
}

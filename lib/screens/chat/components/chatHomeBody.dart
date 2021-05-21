import 'package:flutter/material.dart';
import 'package:instagram/providers/chat.dart';
import 'package:instagram/screens/chat/components/chatMessageTile.dart';
import 'package:provider/provider.dart';

class ChatHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Chat>(context);
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, index) {
        var chatItem = provider.indidualChats[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: ChatMessageTile(
            chatItem.sender.username,
            chatItem.subtitle,
            haveUnreadmessages: chatItem.unseenMessages,
            chatID: chatItem.id,
          ),
        );
      },
      itemCount: provider.indidualChats.length,
    );
  }
}

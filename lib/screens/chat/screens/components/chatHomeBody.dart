import 'package:flutter/material.dart';
import 'package:instagram/screens/chat/screens/components/chatMessageTile.dart';

class ChatHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: ChatMessageTile(
            'farhansyedain',
            'how are you this is completely an insance...',
            haveUnreadmessages: index == 0 ? false : true,
          ),
        );
      },
      itemCount: 2,
    );
  }
}

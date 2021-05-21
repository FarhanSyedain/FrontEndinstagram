import 'package:flutter/material.dart';
import 'package:instagram/models/chat/chat.dart';

class Chat with ChangeNotifier {
  List<IndidualChat> indidualChats = [
    IndidualChat(
      Sender(
        'Mehran Gulzar',
        profilePicture: Image.asset('test.png'),
      ),
      unseenMessages: false,
      subtitle: '5 min ago',
      id: DateTime.now().subtract(Duration(seconds: 2999)).toString(),
    )
  ];
}

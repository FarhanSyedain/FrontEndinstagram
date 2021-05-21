import 'package:flutter/material.dart';
import '../../../../models/chat/chat.dart' as chat;
import 'package:instagram/screens/chat/screens/components/inputBar.dart';
import 'package:provider/provider.dart';
import 'messages.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String replyMessage = '';
  

  final ScrollController _scrollController = ScrollController();

  void prepareReply(String message) {
    setState(() {
      if (message == null) {
        message = '';
      }
      replyMessage = message;
    });
  }

  void scrollToTheEnd(double lastMessageHeight) {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + lastMessageHeight,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final indieChatItem = Provider.of<chat.IndidualChat>(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              return Message(
                indieChatItem.messageSegments[index],
                received: indieChatItem.messageSegments[index].first.recieved,
                profilePicture: indieChatItem.sender.profilePicture,
                prepareReply: prepareReply,
              );
            },
            itemCount: indieChatItem.messageSegments.length,
          ),
        ),
        replyMessage.isEmpty
            ? InputBar(
                scroll: scrollToTheEnd,
              )
            : InputBar(
                replyTo: replyMessage,
                prepareReply: prepareReply,
                scroll: scrollToTheEnd,
              ),
      ],
    );
  }
}

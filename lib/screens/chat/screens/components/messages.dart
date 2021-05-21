import 'package:flutter/material.dart';
import 'package:instagram/components/profileAvatar/avatar.dart';
import 'package:instagram/models/chat/chat.dart' as chat;
import 'package:instagram/screens/chat/screens/components/dilogBox.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class Message extends StatelessWidget {
  final Image profilePicture;

  final List<chat.Message> messages;
  final received;
  final prepareReply;
  Message(
    this.messages, {
    this.profilePicture,
    this.received = false,
    this.prepareReply,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          received ? MainAxisAlignment.start : MainAxisAlignment.end,
      textBaseline: TextBaseline.alphabetic,
      children: [
        if (received)
          Row(
            children: [
              SizedBox(width: 5),
              ProfileAvatar(
                AssetImage('test.png'),
                width: 35,
                height: 35,
              ),
              SizedBox(width: 10),
            ],
          ),
        Column(
          crossAxisAlignment:
              received ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: messages.map((e) {
            return ChangeNotifierProvider.value(
              value: e,
              builder: (context, child) {
                return MessageBody(prepareReply);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class MessageBody extends StatelessWidget {
  final Function prepareReply;
  MessageBody(this.prepareReply);

  void showMessageOptions(BuildContext context, chat.Message message,
      chat.IndidualChat indidualChat) {
    List<String> msgs = [];

    if (!message.recieved) {
      msgs.add('Unsend');
    }

    if (!message.likedByReciever) {
      msgs.add('Like');
    } else {
      msgs.add('Unlike');
    }

    msgs.add('Reply');
    msgs.add('Copy Text');

    showDialog(
        context: context,
        builder: (context) {
          return MessageOptions(msgs);
        }).then(
      (value) => performAction(value, message, indidualChat),
    );
  }

  void performAction(
      String action, chat.Message message, chat.IndidualChat indieChat) {
    if (action == 'Like' || action == 'Unlike') {
      if (message.recieved) {
        indieChat.toggleLike(message.id);
      } else {
        message.toggleLike();
      }
    } else if (action == 'Reply') {
      prepareReply(message.message);
    } else if (action == 'Unsend') {
      //Delete the message then
      indieChat.unSendMessage(message.id);
    } else if (action == 'Copy Text') {
      Clipboard.setData(ClipboardData(text: message.message));
    }
  }

  @override
  Widget build(BuildContext context) {
    final message = Provider.of<chat.Message>(context);
    final indidualChat = Provider.of<chat.IndidualChat>(context, listen: false);
    return Column(
      crossAxisAlignment:
          message.recieved ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        if (message.isReply)
          Container(
            constraints: BoxConstraints(maxWidth: 200),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                message.replyTo,
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(21, 62, 43, .6),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        GestureDetector(
          onTap: () => prepareReply(message.message),
          onLongPress: () => showMessageOptions(context, message, indidualChat),
          onDoubleTap: !message.recieved
              ? () => message.toggleLike()
              : () => indidualChat.toggleLike(message.id),
          child: Column(
            crossAxisAlignment: message.recieved
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 300,
                  minHeight: 40,
                ),
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  message.message,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(21, 32, 43, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
              ),
              if (message.isLiked)
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      ),
                      if (message.likedByReciever && message.likedBySender)
                        Row(
                          children: [
                            ProfileAvatar(
                              AssetImage('test.png'),
                              width: 15,
                              height: 15,
                              hasUnseenStories: false,
                            ),
                            ProfileAvatar(
                              AssetImage('test.png'),
                              width: 15,
                              height: 15,
                            ),
                          ],
                        )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

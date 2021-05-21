import 'package:flutter/material.dart';
import 'package:instagram/components/profileAvatar/avatar.dart';

class ChatMessageTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool haveUnreadmessages;
  final String chatID;

  ChatMessageTile(this.title, this.subtitle,
      {this.haveUnreadmessages = false, this.chatID});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/indidual-chat',
          arguments: {'id': chatID},
        );
      },
      child: ListTile(
        leading: ProfileAvatar(
          AssetImage('test.png'),
          width: 55,
          height: 55,
        ),
        title: Text(
          title,
          style: haveUnreadmessages
              ? Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )
              : Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor.withAlpha(250),
                  ),
        ),
        subtitle: Text(
          subtitle,
          style: haveUnreadmessages
              ? Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 13,
                    color: Theme.of(context).primaryColor.withAlpha(170),
                    fontWeight: FontWeight.w600,
                  )
              : Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 13,
                    color: Theme.of(context).primaryColor.withAlpha(150),
                  ),
        ),
        trailing: haveUnreadmessages
            ? Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue,
                ),
              )
            : null,
      ),
    );
  }
}

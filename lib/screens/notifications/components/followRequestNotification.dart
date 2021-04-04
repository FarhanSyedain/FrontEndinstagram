import 'package:flutter/material.dart';
import 'package:instagram/components/profileAvatar/avatar.dart';
import 'dart:io';

class FollowRequestNotification extends StatefulWidget {
  @override
  _FollowRequestNotificationState createState() =>
      _FollowRequestNotificationState();
}

class _FollowRequestNotificationState extends State<FollowRequestNotification> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfileAvatar(
        AssetImage('test.png'),
      ),
      title: Text(
        'bat_zingat send you a follow request',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 13,
        ),
      ),
      subtitle: Text(
        '10 Sec',
        style: TextStyle(
          color: Theme.of(context).primaryColor.withAlpha(200),
          fontSize: 13,
        ),
      ),
    );
  }
}

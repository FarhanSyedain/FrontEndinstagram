import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram/components/followButton/button.dart';
import 'package:instagram/components/profileAvatar/avatar.dart';

class FollowNotification extends StatefulWidget {
  @override
  _FollowNotificationState createState() => _FollowNotificationState();
}

class _FollowNotificationState extends State<FollowNotification> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfileAvatar(
        AssetImage('test.png'),
      ),
      title: Text(
        'bat_zingat has started following you',
        style: TextStyle(
          fontSize: 13,
          color: Theme.of(context).primaryColor,
        ),
      ),
      subtitle: Text(
        '2 Min',
        style: TextStyle(
          color: Theme.of(context).primaryColor.withAlpha(200),
          fontSize: 13,
        ),
      ),
      trailing: FollowButton(),
    );
  }
}

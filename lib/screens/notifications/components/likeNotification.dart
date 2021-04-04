import 'package:flutter/material.dart';
import 'package:instagram/components/profileAvatar/avatar.dart';

class LikeNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfileAvatar(
        AssetImage('test.png'),
      ),
      title: Text(
        'bat_zingat liked your post',
        style: TextStyle(
          fontSize: 13,
          color: Theme.of(context).primaryColor,
        ),
      ),
      subtitle: Text(
        '2 Min',
        style: TextStyle(
          fontSize: 13,
          color: Theme.of(context).primaryColor.withAlpha(200),
        ),
      ),
      trailing: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'test.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

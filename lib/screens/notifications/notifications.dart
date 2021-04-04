import 'package:flutter/material.dart';
import 'package:instagram/screens/notifications/components/commentNotification.dart';
import 'package:instagram/screens/notifications/components/followRequestNotification.dart';

class NotificationScreen extends StatelessWidget {
  var notifications;

  PreferredSizeWidget appBar(context) {
    return AppBar(
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      backwardsCompatibility: false,
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 5,
      shadowColor: Theme.of(context).backgroundColor.withAlpha(200),
      title: Text(
        'Notifications',
        style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return notifications != null
        ? Container(
            child: Center(
              child: Text(
                'No Notifications',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              if (index == 0) {
                return FollowRequestNotification();
              }
              return CommentNotification();
            },
            itemCount: 2,
          );
  }
}

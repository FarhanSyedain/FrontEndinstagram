import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/screens/profile/screens/components/body.dart';

class EditProfileScreen extends StatelessWidget {
  final body = EditScreenBody();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => body.submit(context),
            color: Colors.blue,
          ),
        ],
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
          ),
        ),
      ), body: body,

    );
  }
}

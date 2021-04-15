import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {},
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
      ),
    );
  }
}

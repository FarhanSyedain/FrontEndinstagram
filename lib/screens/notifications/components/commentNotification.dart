import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram/components/profileAvatar/avatar.dart';
import 'package:instagram/utilities/highlightMentionsHashtags.dart';

class CommentNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileAvatar(
            AssetImage('test.png'),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Container(
                    child: RichText(
                      text: TextSpan(
                        children: highlightMentionsHashtags(
                          'bat_zingat mentioned you in a comment: This is a multi @farhanSyedain line comment; just making it bigger and bigger by adding text to it',
                          context,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '2 Min ago',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor.withAlpha(200),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        child: Container(
                          child: Icon(
                            Icons.favorite,
                            size: 12,
                            // color: Theme.of(context).primaryColor.withAlpha(200),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'test.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

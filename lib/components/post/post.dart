import 'package:flutter/material.dart';

import 'postFile.dart';
import 'lowerRow.dart';
import 'upperRow.dart';
import 'lowerSegment.dart';

class Post extends StatelessWidget {
  final String id;

  Post(this.id);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UpperRow(), //The Row containing username , profile picture and menu icon

        SizedBox(height: 5),

        PostFile(), //The post itself

        LowerRow(), //The Row with Like , comment , share and bookmark buttons

        LowerSegment(), //Likes count, discription etc,

        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

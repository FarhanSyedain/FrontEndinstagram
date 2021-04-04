import 'package:flutter/material.dart';
import 'induidalStory.dart';

class StoryBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(top:10,bottom: 5),
            child: Row(
              children: [
                YourStoryItem(),
                StoryItem(),
                StoryItem(),
                StoryItem(),
                StoryItem(),
                StoryItem(),
                StoryItem(),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor.withAlpha(80),
        ),
      ],
    );
  }
}

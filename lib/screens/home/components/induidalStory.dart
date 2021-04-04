import 'package:flutter/material.dart';

class StoryContainer extends StatelessWidget {
  final Widget storyAvatar;
  final String text;

  StoryContainer(this.storyAvatar, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      child: Column(
        children: [
          storyAvatar,
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoryContainer(
      Container(
        padding: EdgeInsets.all(4),
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(103, 178, 111, 1),
              Color.fromRGBO(76, 162, 205, 1),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'test.png',
              ),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
        ),
      ),
      'farhansyedain',
    );
  }
}

class YourStoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoryContainer(
      Stack(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(103, 178, 111, 1),
                  Color.fromRGBO(76, 162, 205, 1),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'test.png',
                  ),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            height: 3,
            width: 3,
            bottom: 30,
            right: 30,
            child: IconButton(
              icon: Icon(
                Icons.add_circle_rounded,
                color: Theme.of(context).primaryColor,
                size: 25,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      'Your Story',
    );
  }
}

import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double width;
  final double height;
  final AssetImage picture;
  final hasUnseenStories;
  final disabled;

  ProfileAvatar(
    this.picture, {
    this.width,
    this.height,
    this.disabled = false,
    this.hasUnseenStories = false,
  });

  @override
  Widget build(BuildContext context) {
    return hasUnseenStories
        ? Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(103, 178, 111, 1),
                  Color.fromRGBO(76, 162, 205, 1),
                ],
              ),
            ),
            child: buildInnerContainer(context),
          )
        : buildInnerContainer(context);
  }

  Widget buildInnerContainer(BuildContext context) {
    return Container(
      width: width == null ? 50 : width,
      height: height == null ? 50 : height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
          image: picture,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

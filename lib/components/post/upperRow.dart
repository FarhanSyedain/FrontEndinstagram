import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';
import 'package:provider/provider.dart';

class UpperRow extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context,listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 15),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                image: DecorationImage(
                  image: post.userProfilePicture.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              post.user,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        Container(
          child: IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

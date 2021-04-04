import 'package:flutter/material.dart';
import '../../models/post.dart';
import 'package:provider/provider.dart';

class LowerRow extends StatefulWidget {
  @override
  _LowerRowState createState() => _LowerRowState();
}

class _LowerRowState extends State<LowerRow> {
  Widget build(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Consumer<Post>(
              builder: (ctx, post, child) => IconButton(
                padding: EdgeInsets.all(4),
                icon: Icon(
                  post.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: post.isLiked
                      ? Colors.red
                      : Theme.of(context).primaryColor,
                  size: 25,
                ),
                onPressed: post.toggleLike,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(4),
              icon: Icon(
                Icons.comment,
                color: Theme.of(context).primaryColor,
                size: 25,
              ),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.all(4),
              icon: Icon(
                Icons.share,
                color: Theme.of(context).primaryColor,
                size: 25,
              ),
              onPressed: () {},
            ),
          ],
        ),
        IconButton(
          padding: EdgeInsets.all(4),
          icon: Icon(
            Icons.bookmark_border_outlined,
            color: Theme.of(context).primaryColor,
            size: 25,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

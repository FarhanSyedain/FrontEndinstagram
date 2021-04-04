import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/post.dart';

class PostFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Post>(
        builder: (ctx, post, child) => post.postFile,
      ),
    );
  }
}

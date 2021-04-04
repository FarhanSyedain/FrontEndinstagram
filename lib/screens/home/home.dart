import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/components/post/post.dart';
import '../../providers/posts.dart';
import 'package:provider/provider.dart';
import 'components/storiesPanel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StoryBar(),
          Consumer<Posts>(
            builder: (ctx, data, child) => ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemBuilder: (ctx, index) {
                return ChangeNotifierProvider.value(
                  value: data.posts[index],
                  builder: (context, child) {
                    return Post(
                      data.posts[index].id,
                    );
                  },
                );
              },
              itemCount: data.posts.length,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
      backwardsCompatibility: false,
      brightness: Brightness.light,
      centerTitle: true,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: IconButton(
        icon: Icon(
          Icons.add_box_outlined,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
        onPressed: () {},
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Instagram',
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.chat,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

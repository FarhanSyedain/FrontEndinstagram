import 'package:flutter/material.dart';
import 'package:instagram/screens/profile/components/tabSwitch.dart';
import 'package:instagram/screens/profile/components/tabs/tags.dart';
import '../components/tabs/posts.dart';

class ListPosts extends StatefulWidget {
  @override
  _ListPostsState createState() => _ListPostsState();
}

class _ListPostsState extends State<ListPosts> {
  var index = 0;

  void changeTab(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TabSwitch(
              tabIndex: 0,
              chagneTab: changeTab,
              icon: Icon(
                Icons.grid_on,
                color: index == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withAlpha(150),
              ),
              showBorder: index == 0,
            ),
            TabSwitch(
              tabIndex: 1,
              chagneTab: changeTab,
              icon: Icon(
                Icons.perm_contact_calendar_sharp,
                color: index == 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withAlpha(150),
              ),
              showBorder: index == 1,
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        index == 0 ? Posts() : TaggedIn(),
      ],
    );
  }
}

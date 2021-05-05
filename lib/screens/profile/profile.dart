import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/screens/profile/components/tab.dart';
import 'package:instagram/screens/profile/components/uppperSection.dart';


class ProfilePage extends StatelessWidget {
  PreferredSizeWidget appBar(context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backwardsCompatibility: false,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Row(
        children: [
          Text(
            'farhansyedain',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 24,
                ),
          ),
          SizedBox(
            width: 5,
          ),
          RotatedBox(
            quarterTurns: -1,
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 16,
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.add,
            size: 32,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.menu,
            size: 32,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UpperSection(),
          ListPosts(),
        ],
      ),
    );
  }
}

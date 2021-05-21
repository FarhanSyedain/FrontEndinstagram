import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/screens/chat/components/chatHomeBody.dart';

class ChatHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ChatHomeBody(),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
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
    );
  }
}

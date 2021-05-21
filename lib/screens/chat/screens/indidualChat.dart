
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/components/profileAvatar/avatar.dart';
import 'package:instagram/providers/chat.dart';
import 'package:instagram/screens/chat/screens/components/body.dart';
import 'package:provider/provider.dart';

class IndidualChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final provider = Provider.of<Chat>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(context),
      body: ChangeNotifierProvider.value(
        value: provider.indidualChats.firstWhere(
          (element) => element.id == args['id'], orElse: () => null
        ),
        builder: (context, child) {
          return Body();
        },
      ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: Row(
        children: [
          ProfileAvatar(
            AssetImage(
              'test.png',
            ),
            width: 40,
            height: 40,
          ),
          SizedBox(width: 10),
          Text(
            'farhansyedain',
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 14),
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.videocam_outlined),
          onPressed: () {},
          iconSize: 30,
        ),
        IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () {},
          iconSize: 30,
        ),
      ],
    );
  }
}

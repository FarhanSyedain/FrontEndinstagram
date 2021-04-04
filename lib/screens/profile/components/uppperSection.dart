import 'package:flutter/material.dart';
import 'package:instagram/components/profileAvatar/avatar.dart';
import 'package:instagram/utilities/highlightMentionsHashtags.dart';

class UpperSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileAvatar(
                AssetImage(
                  'test.png',
                ),
                height: 95,
                width: 95,
              ),
              Column(
                children: [
                  Text(
                    '12',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    'Posts',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Theme.of(context).primaryColor.withAlpha(200),
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '22',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    'Followers',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Theme.of(context).primaryColor.withAlpha(200),
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '44',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    'Following',
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: Theme.of(context).primaryColor.withAlpha(200),
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              'farhansyedain',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.start,
            ),
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            child: RichText(
              text: TextSpan(
                children: highlightMentionsHashtags(
                    '''This is a multi line bio This contains @mentions As well as #Highlight''',
                    context),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Theme.of(context).primaryColor.withAlpha(150),
                  width: .5,
                ),
              ),
            ),
            onPressed: () {},
            child: Container(
              width: double.infinity,
              child: Text(
                'Edit Profile',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

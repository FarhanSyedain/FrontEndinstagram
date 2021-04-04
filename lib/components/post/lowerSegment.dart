import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../models/post.dart';
import 'package:instagram/utilities/highlightMentionsHashtags.dart';
import 'package:provider/provider.dart';

class LowerSegment extends StatelessWidget {

  Widget build(BuildContext context) {
    final post = Provider.of<Post>(context);

    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              post.likeCount.toString() + ' likes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 5),
            child: RichText(
              text: TextSpan(
                text: 'View all ${post.commentCount} comments',
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).primaryColor.withAlpha(150),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => print('Todo:Implement function'),
              ),
            ),
          ),
          Discription(post.desc),
          AddComment(),
          Container(
            margin: EdgeInsets.only(top: 5),
            width: double.infinity,
            child: Text(
              post.dateUpload.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).primaryColor.withAlpha(150),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Discription extends StatefulWidget {
  final String description;

  Discription(this.description);

  @override
  _DiscriptionState createState() => _DiscriptionState();
}

class _DiscriptionState extends State<Discription> {
  var showMoreButtonClicked;

  void showMoreDescription() {
    setState(() {
      showMoreButtonClicked = true;
    });
  }

  bool get showShowMoreButton {
    return widget.description.length > 100;
  }

  List<TextSpan> getDiscription(showMoreButton) {
    String desc;

    if (showMoreButton) {
      desc = widget.description.substring(0, 100);
    } else {
      desc = widget.description;
    }

    List<TextSpan> textSpans = highlightMentionsHashtags(desc, context);

    if (showMoreButton) {
      textSpans.add(
        TextSpan(
          text: 'read more...',
          style: TextStyle(
            color: Theme.of(context).primaryColor.withAlpha(150),
            fontSize: 13,
          ),
          recognizer: TapGestureRecognizer()..onTap = showMoreDescription,
        ),
      );
    }

    return textSpans;
  }

  @override
  Widget build(BuildContext context) {
    if (showShowMoreButton) {
      if (showMoreButtonClicked == null) {
        showMoreButtonClicked = false;
      }
    }

    return Container(
      margin: EdgeInsets.only(top: 5),
      width: double.infinity,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 12,
          ),
          children: getDiscription(
            showMoreButtonClicked == null
                ? false
                : showMoreButtonClicked
                    ? false
                    : true,
          ),
        ),
      ),
    );
  }
}

class AddComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              image: DecorationImage(
                image: AssetImage('test.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Add a Comment..',
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).primaryColor.withAlpha(150),
            ),
          ),
        ],
      ),
    );
  }
}

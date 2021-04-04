import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

List<TextSpan> highlightMentionsHashtags(text,context) {
    List<TextSpan> textSpans = [];

    var textSpan = '';
    List splittedDesc = text.split(' ');

    for (var i = 0; i < splittedDesc.length; i++) {
      String word = splittedDesc[i];

      if (word.startsWith('@')) {
        textSpans.add(
          TextSpan(
            text: textSpan,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        );
        textSpan = '';
        textSpans.add(
          TextSpan(
            text: word + ' ',
            recognizer: TapGestureRecognizer()
              ..onTap = () => print('Todo:Add function'),
            style: TextStyle(color: Colors.blue,fontSize: 12),
          ),
        );
      } else if (word.startsWith('#')) {
        textSpans.add(
          TextSpan(
            text: textSpan,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        );
        textSpan = '';
        textSpans.add(
          TextSpan(
            text: word + ' ',
            recognizer: TapGestureRecognizer()
              ..onTap = () => print('Todo:Add function'),
            style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.blue,fontSize: 12),
          ),
        );
      } else {
        textSpan += word + ' ';
      }
    }
    if (textSpan.length > 0) {
      textSpans.add(
        TextSpan(
          text: textSpan,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      );
    }
    return textSpans;
  }
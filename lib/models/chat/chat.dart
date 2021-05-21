import 'dart:math';

import 'package:flutter/material.dart';

enum MessageReciever { user, sender }

class Message with ChangeNotifier {
  final String id;
  final String message;
  final bool isReply;
  final String replyTo;
  final String replyToId;

  bool likedByReciever; //User using the app
  bool likedBySender;
  bool recieved;
  DateTime dated;

  bool get isLiked {
    return likedBySender || likedByReciever;
  }

  Future<void> toggleLike({bool notifyListeners_ = true}) {
    this.likedByReciever = !this.likedByReciever;
    if (notifyListeners_) {
      notifyListeners();
    }
  }

  Message(
    this.message, {
    this.likedBySender = false,
    this.likedByReciever = false,
    this.isReply = false,
    this.dated,
    this.recieved,
    this.id,
    this.replyTo,
    this.replyToId,
  });
}

class Sender with ChangeNotifier {
  String username;
  Image profilePicture;
  bool unSeenStories;
  bool hasStories;

  Sender(
    this.username, {
    this.profilePicture,
    this.hasStories = false,
    this.unSeenStories = false,
  });
}

class IndidualChat with ChangeNotifier {
  final Sender sender;
  bool unseenMessages;
  String subtitle;
  final String id;

  Future<void> unSendMessage(String id) {
    var msg = messages.firstWhere((element) => element.id == id, orElse: null);

    messages.remove(msg);
    notifyListeners();
  }

  Future<void> sendMessage(
    String text,
    DateTime date, {
    bool isReply = false,
    replyTo = '',
    replyToId = '',
  }) {
    final _message = Message(
      text,
      dated: DateTime.now(),
      id: date
          .add(
            Duration(
              seconds: Random().nextInt(60),
              microseconds: Random().nextInt(100),
            ),
          )
          .toString(),
      isReply: false,
      replyTo: replyTo,
      replyToId: replyToId,
      recieved: false,
    );

    messages.add(_message);
    notifyListeners();
  }

  Future<void> toggleLike(String id) {
    var msg = messages.firstWhere((element) => element.id == id, orElse: null);
    if (msg != null) {
      msg.toggleLike(notifyListeners_: false);
      notifyListeners();
    }
  }

  List<Message> messages = [
    Message(
      'Hi',
      dated: DateTime.now(),
      id: 'aa',
      isReply: false,
      likedByReciever: false,
      likedBySender: false,
      recieved: true,
    ),
    Message(
      'How are you?',
      dated: DateTime.now().add(Duration(seconds: 3)),
      id: 'ab',
      isReply: false,
      likedByReciever: false,
      likedBySender: false,
      recieved: true,
    ),
    Message(
      'fine',
      dated: DateTime.now().add(Duration(seconds: 6)),
      id: 'ac',
      isReply: false,
      likedByReciever: false,
      likedBySender: true,
      recieved: false,
      replyTo: 'How are you?',
      replyToId: 'ab',
    ),
    Message(
      'How\'s life',
      dated: DateTime.now().add(Duration(seconds: 10)),
      id: 'ad',
      isReply: false,
      likedByReciever: false,
      likedBySender: false,
      recieved: false,
    ),
    Message(
      'Going well',
      dated: DateTime.now().add(Duration(seconds: 12)),
      id: 'ae',
      isReply: false,
      likedBySender: false,
      likedByReciever: true,
      recieved: true,
    ),
    Message(
      'Heard you\'ve passed the exams',
      dated: DateTime.now().add(Duration(seconds: 14)),
      id: 'af',
      recieved: true,
    ),
    Message(
      'Hell ya',
      dated: DateTime.now().add(Duration(seconds: 16)),
      id: 'ag',
      isReply: true,
      replyTo: 'Heard you\'ve passed the exams',
      replyToId: 'af',
      likedByReciever: true,
      likedBySender: true,
      recieved: false,
    ),
  ];

  List<List<Message>> get messageSegments {
    List<List<Message>> output = [];
    List<Message> segment = [];

    for (var i = 0; i < messages.length; i++) {
      MessageReciever currentReciever;
      Message message = messages[i];

      if (output.isNotEmpty) {
        MessageReciever currentReciever = output.last.first.recieved
            ? MessageReciever.sender
            : MessageReciever.user;
      } else {
        MessageReciever currentReciever =
            message.recieved ? MessageReciever.sender : MessageReciever.user;
      }

      if (receiverTypeMatches(message, currentReciever)) {
        if (message.isLiked && message.recieved) {
          segment.add(message);
          output.add([...segment]);
          segment.clear();
          continue;
        }
        segment.add(message);
      } else {
        if (segment.isNotEmpty) {
          output.add([...segment]);
          segment.clear();
        }

        segment.add(message);

        if (message.isLiked && message.recieved) {
          output.add([...segment]);
          segment.clear();
        }
      }
    }
    if (segment.isNotEmpty) {
      output.add(segment);
    }

    return output;
  }

  bool receiverTypeMatches(Message item, MessageReciever currentType) {
    return ((item.recieved && currentType == MessageReciever.sender) ||
        (!item.recieved && currentType == MessageReciever.user));
  }

  IndidualChat(
    this.sender, {
    this.subtitle,
    this.unseenMessages,
    this.id,
  });
}

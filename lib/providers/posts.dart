import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';

class Posts with ChangeNotifier {
  Future<void> toggleLike(String id,bool newVal) async {
    posts.firstWhere((element) => element.id == id).isLiked = newVal;
  }

  List<Post> posts = [
    Post(
      id: '1',
      commentCount: 22,
      likeCount: 103,
      isLiked: true,
      desc:
          'This is the description of this post ; captions are mostly overrated',
      isSaved: false,
      dateUpload: DateTime.now().subtract(
        Duration(days: 1),
      ),
      isVideo: false,
      user: 'bat_zingat',
      // postFile: Image.network(
      //   'https://images.unsplash.com/photo-1584714268709-c3dd9c92b378?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8dXJsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      // ),
      postFile: Image.asset('test.png'),

      // userProfilePicture:
      //     Image.network('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
      userProfilePicture: Image.asset('test.png'),
    ),
    Post(
      id: '2',
      commentCount: 31,
      likeCount: 1200,
      isLiked: false,
      desc: 'this caption contains @mentions as well as #hastags',
      isSaved: false,
      dateUpload: DateTime.now().subtract(
        Duration(
          days: 1,
          hours: 10,
        ),
      ),
      isVideo: false,
      user: 'mehran',
      // postFile: Image.network(
      //   'https://images.unsplash.com/photo-1601894095917-a6555e4ac998?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80',
      // ),
      postFile: Image.asset('test.png'),
      // userProfilePicture: Image.network(
      //     'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
      userProfilePicture: Image.asset('test.png'),
    ),
    Post(
      id: '3',
      commentCount: 1009,
      likeCount: 222,
      isLiked: true,
      desc:
          'This is the description of this post ; captions are mostly overrated',
      isSaved: true,
      dateUpload: DateTime.now().subtract(
        Duration(days: 8),
      ),
      isVideo: false,
      user: 'farhansyeaain',
      postFile: Image.asset('test.png'),
      // postFile: Image.network(
      //   'https://images.unsplash.com/photo-1515961896317-adf9e14bdcc0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8bGFuZHNjYXBlc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      // ),
      userProfilePicture: Image.asset('test.png'),
      // userProfilePicture: Image.network(
      //     'https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fHBlb3BsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
    ),
    Post(
        id: '4',
        commentCount: 3322,
        likeCount: 233,
        isLiked: true,
        desc:
            'This is the description of this post ; captions are mostly overrated',
        isSaved: false,
        dateUpload: DateTime.now().subtract(
          Duration(days: 9),
        ),
        isVideo: false,
        user: 'bat_zingat',
        postFile: Image.asset('test.png'),
        userProfilePicture: Image.asset('test.png')
        // postFile: Image.network(
        //   'https://images.unsplash.com/photo-1516298773066-c48f8e9bd92b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
        // ),
        // userProfilePicture: Image.network(
        //     'https://images.unsplash.com/photo-1488161628813-04466f872be2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80'),
        ),
    Post(
        id: '5',
        commentCount: 22222,
        likeCount: 1033,
        isLiked: true,
        desc:
            'This is the description of this post ; captions are mostly overrated',
        isSaved: true,
        dateUpload: DateTime.now().subtract(
          Duration(days: 10),
        ),
        isVideo: false,
        user: 'suhaib',
        postFile: Image.asset('test.png'),
        userProfilePicture: Image.asset('test.png')
        // postFile: Image.network(
        //     'https://images.unsplash.com/photo-1536257104079-aa99c6460a5a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
        // userProfilePicture: Image.network(
        //     'https://images.unsplash.com/photo-1463453091185-61582044d556?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
        ),
  ];
}

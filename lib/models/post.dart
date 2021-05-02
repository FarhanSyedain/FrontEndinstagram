import 'package:flutter/material.dart';

class Post with ChangeNotifier {
  String id;
  String user;
  int likeCount;
  int commentCount;
  bool isLiked;
  bool isSaved;
  String desc;
  DateTime dateUpload;
  Image postFile;
  bool isVideo;
  Image userProfilePicture;

  Post({
    this.id,
    this.user,
    this.likeCount,
    this.commentCount,
    this.isLiked,
    this.isSaved,
    this.desc,
    this.dateUpload,
    this.postFile,
    this.isVideo,
    this.userProfilePicture,
  });

  Future<void> toggleLike() async {
    //Make changes in the Ui first

    this.isLiked = !this.isLiked;

    if (this.isLiked) {
      this.likeCount += 1;
    } else {
      this.likeCount -= 1;
    }

    notifyListeners();

    
  }
}

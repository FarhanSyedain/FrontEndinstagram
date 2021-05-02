import 'package:flutter/widgets.dart';

class Owner with ChangeNotifier {
  String username;
  int followingCount;
  int followersCount;
  int postCount;
  Image profilePicture;
  String fullName;
  String bio;
  
  Owner({
    this.username,
    this.bio,
    this.followersCount,
    this.fullName,
    this.followingCount,
    this.postCount,
    this.profilePicture,
  });

  

}

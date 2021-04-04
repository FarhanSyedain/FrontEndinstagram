import 'package:flutter/material.dart';
import 'package:instagram/screens/home/home.dart';
import 'package:instagram/screens/notifications/notifications.dart';
import 'package:instagram/screens/profile/profile.dart';
import '../search/search.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var pageIndex = 0;

  void changePage(index) {
    if (index != pageIndex) {
      setState(() {
        pageIndex = index;
      });
    }
  }

  final searchPage = SearchPage();
  final homePage = HomeScreen();
  final notificationPage = NotificationScreen();
  final profilePage = ProfilePage();

  PreferredSizeWidget get appBar {
    if (pageIndex == 0) {
      return homePage.appBar(context);
    } else if (pageIndex == 1) {
      return searchPage.appBar(context);
    } else if (pageIndex == 2) {
      return notificationPage.appBar(context);
    }
    return profilePage.appBar(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar,
      body: IndexedStack(
        children: [
          homePage,
          searchPage,
          notificationPage,
          profilePage,
        ],
        index: pageIndex,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: .3,
              color: Theme.of(context).primaryColor.withAlpha(150),
            ),
          ),
        ),
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => changePage(0),
              icon: Icon(
                Icons.home,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () => changePage(1),
              icon: Icon(
                Icons.search,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () => changePage(2),
              icon: Icon(
                Icons.notifications,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            GestureDetector(
              onTap: () => changePage(3),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage(
                      'test.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

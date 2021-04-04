import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/providers/posts.dart';
import 'package:provider/provider.dart';
import 'screens/main/tabScreen.dart';

import 'constants/theme.dart' as themes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Posts>(
          create: (ctx) => Posts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themes.lightTheme,
        darkTheme: themes.darkTheme,
        themeMode: ThemeMode.system,
        home: TabScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.black,
  backgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 36,
      fontFamily: 'Billabong',
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 13,
    ),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
    backgroundColor: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.white,
  backgroundColor: Color.fromRGBO(0, 0, 0, 1),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 13,
    ),
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 36,
      fontFamily: 'Billabong',
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Color.fromRGBO(0, 0, 0, 1),
    ),
  ),
);

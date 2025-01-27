import 'package:flutter/material.dart';

class Constants {
  static String appName = "Devhub";

  //Colors for theme
  static Color lightPrimary = Colors.blue;
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.blue;
  static Color darkAccent = Colors.blueAccent;
  static Color lightBG = Color(0xfffffcfc);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;
  static Color appBarColor = Colors.white;

  static Color flatButtonTextColor = Colors.blue;
  static Color buttonColor = Colors.blue;

//static Color flatButtonTextColor = Color(0xffff531f);
//  static Color buttonColor = Color(0xffff531f);

  static const int splash_time = 2;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: appBarColor,
      iconTheme: IconThemeData(
          color: Colors.blue,
          opacity: 1.0,
          size: 50.0
      ),
      textTheme: TextTheme(
      title: TextStyle(
      color: darkBG,
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    ),
  )

  ,

  )

  ,

  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}

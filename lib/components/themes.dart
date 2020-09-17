import 'package:flutter/material.dart';

// Theme management Class to be made into provider
class ThemeManage{
  int _currentTheme=0; // Current theme

  // List of themes
  List <ThemeData> themeData=[
    ThemeData(
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
      backgroundColor: Colors.white,
      accentColor: Colors.black54,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.black54,
          fontSize: 65,
          fontWeight: FontWeight.w800,
        ),
        headline2: TextStyle(
          color: Colors.black54,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        headline3: TextStyle(
          color: Colors.black54,
          fontSize: 60,
          fontWeight: FontWeight.w700,
        ),
        headline4: TextStyle(
          color: Colors.black54,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
        headline6: TextStyle(
          color: Colors.black54,
          fontSize: 25,
          fontWeight: FontWeight.w500,
          letterSpacing: 18,
        ),
        bodyText1: TextStyle(
          color: Colors.black54,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 5,
        ),
        bodyText2: TextStyle(
          color: Colors.black54,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black54,
      ),
    ),
  ];

  ThemeData returnTheme(){
    return themeData[_currentTheme];
  }

  void setTheme(int x){
    _currentTheme = x;
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/styles/color.dart';

ThemeData lightTheme = ThemeData(
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(fontFamily: "boo"),
      unselectedLabelStyle: TextStyle(fontFamily: "boo", fontSize: 18.0),
      labelPadding: EdgeInsets.all(5.0),
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black,
            fontFamily: "arbic"),
        bodyText2:
            TextStyle(color: Colors.black45, fontWeight: FontWeight.w500)),
    primarySwatch: defaultColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.teal, backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        titleSpacing: 20.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        backwardsCompatibility: false,
        titleTextStyle: TextStyle(
            color: Colors.teal, fontSize: 20.0, fontWeight: FontWeight.bold,fontFamily: "pacifico"),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )));

ThemeData darkTheme = ThemeData(

    primarySwatch: defaultColor,
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(fontFamily: "boo"),
      unselectedLabelStyle: TextStyle(fontFamily: "boo", fontSize: 18.0),
      labelPadding: EdgeInsets.all(5.0),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.teal,
        backgroundColor: HexColor('0C0C0C'),
        unselectedItemColor: Colors.grey),
    scaffoldBackgroundColor: HexColor('0C0C0C'),
    appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: HexColor('0C0C0C'),
        elevation: 0.0,
        backwardsCompatibility: false,
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold,fontFamily: "pacifico"),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('0C0C0C'),
          statusBarIconBrightness: Brightness.light,
        )),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: Colors.white,
          fontFamily: "arbic",
        ),
        bodyText2:
            TextStyle(color: Colors.black, fontWeight: FontWeight.w500)));

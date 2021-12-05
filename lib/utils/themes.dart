import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: "Open Sans",
        cardColor: Colors.white,
        canvasColor: Colors.indigo[100],
        buttonColor: darkBluishColor,
        accentColor: darkBluishColor,
        focusColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          textTheme: Theme.of(context).textTheme,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), side: BorderSide.none),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        focusColor: Colors.transparent,
        fontFamily: "Open Sans",
        cardColor: Colors.black,
        canvasColor: Colors.grey[900],
        buttonColor: ligthBluishColor,
        accentColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0,
          centerTitle: true,
          toolbarTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.blueGrey[900],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), side: BorderSide.none),
        ),
      );

  // Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluishColor = const Color(0xff403b58);
  static Color ligthBluishColor = Colors.indigoAccent;
}

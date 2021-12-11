import 'package:flutter/material.dart';

class MyTheme {
  Color bluegrey = Colors.blueGrey.shade700;
  Color lightGrey = Colors.grey.shade300;
  Color darkGrey = Colors.grey.shade600;

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: const Color(0xFF313A42),
      primaryColor: bluegrey,
      accentColor: lightGrey,
      secondaryHeaderColor: darkGrey,
      hintColor: lightGrey,

      fontFamily: "ReadexPro",

      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.blue),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: MyTheme().bluegrey,
          ),
        ),
      ),

      // Buttons......
      buttonTheme: ButtonThemeData(
        buttonColor: darkGrey,
        padding: EdgeInsets.symmetric(horizontal: 20),
        minWidth: 200,
        height: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyTheme {
  Color _bluegrey = Colors.blueGrey.shade700;
  Color __lightGrey = Colors.grey.shade300;
  Color __darkGrey = Colors.grey.shade600;

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: Colors.blueGrey[900],
      primaryColor: _bluegrey,
      accentColor: __lightGrey,
      secondaryHeaderColor: __darkGrey,
      hintColor: __lightGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: __lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: _bluegrey),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: __darkGrey,
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

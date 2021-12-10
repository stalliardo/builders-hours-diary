import 'package:flutter/material.dart';

class MyFormStyles {
  static InputDecoration textFormFieldInputDecoration(String labelText) {
    return InputDecoration(
      border: OutlineInputBorder(),
      labelText: labelText,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    );
  }

  static TextStyle textFormStyle() {
    return TextStyle(
      color: Colors.white,
    );
  }
}

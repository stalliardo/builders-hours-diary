import 'package:flutter/material.dart';

class MyFormStyles {
  InputDecoration textFormFieldInputDecoration(String labelText) {
    return InputDecoration(
      border: OutlineInputBorder(),
      labelText: labelText,
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

  TextStyle textFormStyle() {
    return TextStyle(
      color: Colors.white,
    );
  }
}

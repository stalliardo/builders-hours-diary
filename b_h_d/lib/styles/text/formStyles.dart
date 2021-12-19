import 'package:b_h_d/utils/mytheme.dart';
import 'package:flutter/material.dart';

class MyFormStyles {
  static InputDecoration textFormFieldInputDecoration(String labelText) {
    return InputDecoration(
      border: OutlineInputBorder(),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.blue),
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
          color: MyTheme().bluegrey,
        ),
      ),
    );
  }

  static TextStyle textFormStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
  }

  static TextStyle formTitle() {
    return TextStyle(color: Colors.white, fontSize: 20);
  }
}

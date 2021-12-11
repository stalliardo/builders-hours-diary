import 'package:flutter/material.dart';

class MyButtons {
  Widget customBackButton(onPressedCallback) {
    return IconButton(
      onPressed: onPressedCallback,
      icon: Icon(Icons.arrow_back),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      color: Colors.white,
    );
  }
}

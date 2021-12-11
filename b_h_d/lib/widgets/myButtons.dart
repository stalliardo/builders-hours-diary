import 'package:flutter/material.dart';

class MyButtons {
  static Widget customBackButton(VoidCallback onPressedCallback) {
    return IconButton(
      onPressed: onPressedCallback,
      icon: Icon(Icons.arrow_back),
      alignment: Alignment.topLeft,
      color: Colors.white,
    );
  }
}

// FIX - When clicked the feedback is still in the centre of the screen
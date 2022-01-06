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

  static Widget customDropDownButton(String dropDownValue, List<String> items, Function(String value) onChangedCallback) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        style: TextStyle(color: Colors.white),
        value: dropDownValue,
        items: items
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                child: Text(value),
                value: value,
              ),
            )
            .toList(),
        onChanged: (value) => onChangedCallback(value!),
        isExpanded: true,
        iconEnabledColor: Colors.white,
        iconSize: 24,
      ),
    );
  }
}






// FIX - When clicked the feedback is still in the centre of the screen


// Drop down button...
  // Will need to pass in alist of options
  // String for the dropDownValue
  // callback for when an item is changed (onChanged())
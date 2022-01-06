import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  final String selected;
  final List<String> items;
  final Function(String) valueReturned;

  MyDropDownButton({Key? key, required this.selected, required this.items, required this.valueReturned}) : super(key: key);

  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        style: TextStyle(color: Colors.white),
        value: selected,
        items: widget.items
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                child: Text(value),
                value: value,
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            selected = value!;
            widget.valueReturned(value);
          });
        },
        isExpanded: true,
        iconEnabledColor: Colors.white,
        iconSize: 24,
      ),
    );
  }
}

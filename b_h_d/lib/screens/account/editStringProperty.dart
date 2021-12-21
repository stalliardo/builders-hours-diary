import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:flutter/material.dart';

class EditStringProperty extends StatefulWidget {
  String propertyValue;
  EditStringProperty({Key? key, required this.propertyValue}) : super(key: key);

  @override
  _EditStringPropertyState createState() => _EditStringPropertyState();
}

class _EditStringPropertyState extends State<EditStringProperty> {
  final _formKey = GlobalKey<FormState>();
  String newFullName = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: widget.propertyValue,
            onChanged: (value) {
              setState(() {
                newFullName = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Fields cannot be blank";
              }
              if (value == widget.propertyValue) {
                return "Name must be different";
              }
              return null;
            },
            decoration: InputDecoration(labelText: "Full name"),
            style: MyFormStyles.textFormStyle(),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                // Will check here the state of the saveButtonEnabled prop and only save if is valid
                // TODO - what about capitals?????? this counts as a different value, fuck

                String titleString = StringFormatting.toTitleCase("this is, , a test and so on and so on.");
                print("title string = $titleString");
                if (_formKey.currentState!.validate()) {
                  print("good to save");
                }
              },
              child: Text("Save"),
            ),
          )
        ],
      ),
    );
  }
}

// This file will edit simple String based values for the user

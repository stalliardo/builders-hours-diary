import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/services/database.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:flutter/material.dart';

class EditStringProperty extends StatefulWidget {
  String propertyValue;
  String uid;
  EditStringProperty({Key? key, required this.uid, required this.propertyValue}) : super(key: key);

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
              if (StringFormatting.toTitleCase(value) == widget.propertyValue) {
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  StatusCode _result = await MyDatabase().updateSingleField(
                    widget.uid,
                    {"fullName": StringFormatting.toTitleCase(newFullName)},
                  );
                  if (_result == StatusCode.ERROR) {
                  } else {
                    Navigator.pop(context);
                  }
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

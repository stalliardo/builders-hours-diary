import 'package:b_h_d/services/database.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:flutter/material.dart';

class EditEmail extends StatefulWidget {
  String propertyValue;
  String uid;
  EditEmail({Key? key, required this.uid, required this.propertyValue}) : super(key: key);

  @override
  _EditEmailState createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  final _formKey = GlobalKey<FormState>();
  String newEmail = "";

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
                newEmail = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Fields cannot be blank";
              }

              return null;
            },
            decoration: InputDecoration(labelText: "Email"),
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
                  // // StatusCode _result = await MyDatabase().updateSingleField(
                  //   widget.uid,
                  //   {"fullName": StringFormatting.toTitleCase(newFullName)},
                  // );
                  // if (_result == StatusCode.ERROR) {
                  // } else {
                  //   Navigator.pop(context);
                  // }
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

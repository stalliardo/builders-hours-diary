import 'package:b_h_d/screens/account/editStringProperty.dart';
import 'package:flutter/material.dart';

class EditAccountValuesWrapper extends StatefulWidget {
  final String uid;
  final String appBarTitle;
  final String propertyValue;

  EditAccountValuesWrapper({Key? key, required this.uid, required this.appBarTitle, required this.propertyValue}) : super(key: key);

  @override
  _EditAccountValuesWrapperState createState() => _EditAccountValuesWrapperState();
}

class _EditAccountValuesWrapperState extends State<EditAccountValuesWrapper> {
  Widget _loadScreens(String editingType) {
    switch (editingType) {
      case "Full Name":
        return EditStringProperty(uid: widget.uid, propertyValue: widget.propertyValue);

      case "Email":
        break;
      case "Change Password":
        break;
      case "Day Rate":
        break;
      case "Hours in Work Day":
        break;
      case "Payment Frequency":
        break;
      case "Retention Amount %":
        break;
    }

    return Text("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit ${widget.appBarTitle}"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 100, 16, 16),
        child: _loadScreens(widget.appBarTitle),
      ),
    );
  }
}

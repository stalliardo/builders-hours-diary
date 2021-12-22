import 'package:b_h_d/screens/account/changePassword.dart';
import 'package:b_h_d/screens/account/editEmail.dart';
import 'package:b_h_d/screens/account/editStringProperty.dart';
import 'package:b_h_d/screens/account/numericWageInfo.dart';
import 'package:flutter/material.dart';

class EditAccountValuesWrapper extends StatefulWidget {
  final String uid;
  final String appBarTitle;
  final String? propertyValue;

  EditAccountValuesWrapper({Key? key, required this.uid, required this.appBarTitle, this.propertyValue}) : super(key: key);

  @override
  _EditAccountValuesWrapperState createState() => _EditAccountValuesWrapperState();
}

class _EditAccountValuesWrapperState extends State<EditAccountValuesWrapper> {
  Widget _loadScreens(String editingType) {
    switch (editingType) {
      case "Full Name":
        return EditStringProperty(
          uid: widget.uid,
          propertyValue: widget.propertyValue!,
          propertyName: "fullName",
          labelText: "Full Name",
          isSelectMenu: false,
        );

      case "Email":
        return EditEmail(uid: widget.uid, propertyValue: widget.propertyValue!);
      case "Password":
        return ChangePassword(uid: widget.uid);
      case "Day Rate":
        return NumericWageInfo(
          uid: widget.uid,
          propertyValue: widget.propertyValue!,
          propertyName: "dayRate",
          labelText: "Day Rate",
        );
      case "Hours in Work Day":
        return NumericWageInfo(
          uid: widget.uid,
          propertyValue: widget.propertyValue!,
          propertyName: "hoursInWorkDay",
          labelText: "Hours in Work Day",
        );

      case "Payment Frequency":
        return EditStringProperty(
          uid: widget.uid,
          propertyValue: widget.propertyValue!,
          propertyName: "paymentFrequency",
          labelText: "Payment Frequency",
          isSelectMenu: true,
        );
      case "Retention Amount":
        return NumericWageInfo(
          uid: widget.uid,
          propertyValue: widget.propertyValue!,
          propertyName: "retentionAmount",
          labelText: "Retention Amount %",
        );
    }

    return Text("Hello"); // TODO
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

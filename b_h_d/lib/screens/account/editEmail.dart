import 'package:flutter/material.dart';

class EditEmail extends StatefulWidget {
  EditEmail({Key? key}) : super(key: key);

  @override
  _EditEmailState createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Email"),
      ),
      body: Container(
        child: Text("Edit email"),
      ),
    );
  }
}

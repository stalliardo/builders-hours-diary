import 'package:flutter/material.dart';

class EditFullName extends StatefulWidget {
  EditFullName({Key? key}) : super(key: key);

  @override
  _EditFullNameState createState() => _EditFullNameState();
}

class _EditFullNameState extends State<EditFullName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Name"),
      ),
      body: Container(
        child: Text("Edit full name"),
      ),
    );
  }
}

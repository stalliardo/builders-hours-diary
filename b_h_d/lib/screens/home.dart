import 'package:b_h_d/screens/signUp.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/utils/customPageRoute.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Auth().signOut();
            },
            child: Text("Log out"),
          ),
        ],
      ),
    );
  }
}

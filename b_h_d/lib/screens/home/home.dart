import 'package:b_h_d/screens/home/emailNotVerified.dart';
import 'package:b_h_d/screens/home/emailVerified.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  bool emailVerified = false;
  Home({required this.emailVerified});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () async {
              await Auth().signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: widget.emailVerified ? EmailVerified() : EmailNotVerified(),
    );
  }
}

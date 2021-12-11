import 'package:b_h_d/screens/signUp.dart';
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
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            CustomPageRoute(
              child: SignUp(),
            ),
          );
        },
        child: Text("Go to sign up"),
      )),
    );
  }
}

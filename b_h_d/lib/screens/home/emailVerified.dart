import 'package:b_h_d/models/user.dart';
import 'package:b_h_d/screens/home/hasEnteredWageInfo.dart';
import 'package:b_h_d/screens/home/hasNotEnteredWageInfo.dart';
import 'package:b_h_d/screens/root.dart';
import 'package:b_h_d/screens/welcome.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailVerified extends StatefulWidget {
  EmailVerified({Key? key}) : super(key: key);

  @override
  _EmailVerifiedState createState() => _EmailVerifiedState();
}

class _EmailVerifiedState extends State<EmailVerified> {
  @override
  Widget build(BuildContext context) {
    Auth _auth = Provider.of<Auth>(context);
    bool hasEnteredWageInfo = _auth.user.hasEnteredWageInfo;

    return StreamProvider<MyUser>.value(
      value: MyDatabase().userData(_auth.user.uid),
      initialData: MyUser(hasEnteredWageInfo: hasEnteredWageInfo, accountCreated: Timestamp.now()),
      child: Consumer<MyUser>(
        builder: (context, _userData, _) {
          return _userData.hasEnteredWageInfo ? HasEnteredWageInfo() : HasNotEnteredWageInfo(uid: _auth.user.uid);
          // Check if the user.uid exists first
          // if (_userData.uid != null) {
          //   return _userData.hasEnteredWageInfo ? HasEnteredWageInfo() : HasNotEnteredWageInfo(uid: _auth.user!.uid);
          // } else {
          //   return WelcomeScreen();
          // }
        },
      ),
    );
  }
}

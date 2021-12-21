import 'dart:async';

import 'package:b_h_d/services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailNotVerified extends StatefulWidget {
  const EmailNotVerified({Key? key}) : super(key: key);

  @override
  _EmailNotVerifiedState createState() => _EmailNotVerifiedState();
}

class _EmailNotVerifiedState extends State<EmailNotVerified> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic((Duration(seconds: 10)), (timer) async {
      print("Timer called");
      FirebaseAuth _auth = FirebaseAuth.instance;
      await _auth.currentUser?.reload();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 90,
          ),
          Text(
            "Awaiting email verification. You might need to check your junk folder.",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 60,
          ),
          CircularProgressIndicator(
            value: null,
          ),
          SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () async {
              await Auth().sendVerificationEmail();
            },
            child: Text("Resend email"),
          ),
        ],
      ),
    );
  }
}

// TODO - Some text about checking junk folder....

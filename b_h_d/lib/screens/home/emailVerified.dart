import 'package:b_h_d/models/user.dart';
import 'package:b_h_d/screens/home/hasEnteredWageInfo.dart';
import 'package:b_h_d/screens/home/hasNotEnteredWageInfo.dart';
import 'package:b_h_d/services/authentication.dart';
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
    bool hasEnteredWageInfo = _auth.user!.hasEneteredWageInfo!;

    return hasEnteredWageInfo ? HasEnteredWageInfo() : HasNotEnteredWageInfo();
  }
}


// Check the user model for the hasEneteredSalayInfo prop
// When siging up set the hasEneteredWageInfo prop
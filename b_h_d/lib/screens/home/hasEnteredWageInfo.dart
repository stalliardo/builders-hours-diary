import 'package:b_h_d/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HasEnteredWageInfo extends StatefulWidget {
  HasEnteredWageInfo({Key? key}) : super(key: key);

  @override
  _HasEnteredWageInfoState createState() => _HasEnteredWageInfoState();
}

class _HasEnteredWageInfoState extends State<HasEnteredWageInfo> {
  @override
  Widget build(BuildContext context) {
    MyUser _user = Provider.of<MyUser>(context);

    return Container(
      child: Text("Your Day Rate is: ${_user.dayRate}"),
    );
  }
}

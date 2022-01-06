import 'package:b_h_d/models/user.dart';
import 'package:b_h_d/screens/account/EditAccountValuesWrapper.dart';
import 'package:b_h_d/screens/account/removeAccount.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/services/database.dart';
import 'package:b_h_d/utils/customPageRoute.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Widget _passDataToAccountValueWrapper(MyUser _user, String uid, String appBarTitle, String propertyValue, String rowAndLableText) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CustomPageRoute(
            child: EditAccountValuesWrapper(
              uid: uid,
              appBarTitle: appBarTitle,
              propertyValue: propertyValue,
            ),
            parent: AccountScreen(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            rowAndLableText,
            style: TextStyle(color: Colors.grey[400]),
          ),
          Row(
            children: <Widget>[
              Text(
                propertyValue.toString(),
                style: TextStyle(color: Colors.grey[400]),
              ),
              Icon(Icons.chevron_right, color: Colors.grey[400]),
            ],
          )
        ],
      ),
    );
  }

  Stream<MyUser>? _userDataStream;
  late Auth _auth;

  @override
  Widget build(BuildContext context) {
    _auth = Provider.of<Auth>(context);
    if (_auth.user.uid != "") {
      _userDataStream = MyDatabase().userData(_auth.user.uid);

      return Scaffold(
        appBar: AppBar(
          title: Text("My Account"),
        ),
        body: StreamBuilder<MyUser>(
          stream: _userDataStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(
                value: null,
              );
            } else if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
              MyUser _user = snapshot.data!;

              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: <Widget>[
                  Text(
                    "Account Information",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _passDataToAccountValueWrapper(_user, _auth.user.uid, "Full Name", _user.fullName, "Full Name"),
                  SizedBox(
                    height: 20,
                  ),
                  _passDataToAccountValueWrapper(_user, _auth.user.uid, "Email", _user.email, "Email"),
                  SizedBox(
                    height: 20,
                  ),
                  _passDataToAccountValueWrapper(_user, _auth.user.uid, "Password", "", "Change Password"),
                  Divider(
                    height: 30,
                    color: Colors.grey[400],
                  ),
                  Text(
                    "Wage Information",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _passDataToAccountValueWrapper(_user, _auth.user.uid, "Day Rate", _user.dayRate.toString(), "Day Rate"),
                  SizedBox(
                    height: 20,
                  ),
                  _passDataToAccountValueWrapper(_user, _auth.user.uid, "Hours in Work Day", _user.hoursInWorkDay.toString(), "Hours in Work Day"),
                  SizedBox(
                    height: 20,
                  ),
                  _passDataToAccountValueWrapper(_user, _auth.user.uid, "Payment Frequency", _user.paymentFrequency, "Payment Frequency"),
                  SizedBox(
                    height: 20,
                  ),
                  _passDataToAccountValueWrapper(_user, _auth.user.uid, "Retention Amount", _user.retentionAmount.toString(), "Retention Amount %"),
                  Divider(
                    height: 30,
                    color: Colors.grey[400],
                  ),
                  Text(
                    "Account Control",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RemoveAccount(),
                                ));
                          },
                          child: Text("Delete Account"),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      )
                    ],
                  )
                ],
              );
            } else {
              return Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Loading your data....",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircularProgressIndicator(
                      value: null,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

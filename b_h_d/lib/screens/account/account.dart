import 'package:b_h_d/models/user.dart';
import 'package:b_h_d/screens/account/changePassword.dart';
import 'package:b_h_d/screens/account/editEmail.dart';
import 'package:b_h_d/screens/account/editFullName.dart';
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
  @override
  Widget build(BuildContext context) {
    Auth _auth = Provider.of<Auth>(context);

    // MyUser? _user = _auth.user;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
      ),
      body: StreamBuilder<MyUser>(
        stream: MyDatabase().userData(_auth.user!.uid!),
        builder: (context, snapshot) {
          // check that we have data before buidling widgte tree
          print("snapshot from streamBuilder = $snapshot");
          if (snapshot.hasData) {
            MyUser _user = snapshot.data!;
            return ListView(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), children: <Widget>[
              Text(
                "Account Information",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(
                      child: EditFullName(),
                      parent: AccountScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Full Name",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          _user.fullName.toString(),
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey[400]),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(
                      child: EditEmail(),
                      parent: AccountScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          _user.email.toString(),
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey[400]),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(
                      child: ChangePassword(),
                      parent: AccountScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Change Password",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Icon(Icons.chevron_right, color: Colors.grey[400]),
                  ],
                ),
              ),
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
              InkWell(
                onTap: () {
                  print("InkWell cklciked");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Day Rate",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          _user.dayRate.toString(),
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey[400]),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print("InkWell cklciked");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Hours in Work Day",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          _user.hoursInWorkDay.toString(),
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey[400]),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print("InkWell cklciked");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Payment Frequency",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          _user.paymentFrequency.toString(),
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey[400]),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print("InkWell cklciked");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Retention Amount %",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          _user.retentionAmount.toString(),
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey[400]),
                      ],
                    )
                  ],
                ),
              ),
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
                      onPressed: () {},
                      child: Text("Delete Account"),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  )
                ],
              )
            ]);
          } else {
            return Center(
              // width: 100,
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
  }
}

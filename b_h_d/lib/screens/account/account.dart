import 'package:b_h_d/models/user.dart';
import 'package:b_h_d/screens/account/EditAccountValuesWrapper.dart';
import 'package:b_h_d/screens/account/changePassword.dart';
import 'package:b_h_d/screens/account/editEmail.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
      ),
      body: StreamBuilder<MyUser>(
        stream: MyDatabase().userData(_auth.user!.uid!),
        builder: (context, snapshot) {
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
                      child: EditAccountValuesWrapper(
                        uid: _auth.user!.uid!,
                        appBarTitle: "Full Name",
                        propertyValue: _user.fullName!,
                      ),
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




// TODO....
//  - Change full name screen
//  - Change email screen
//  - Change password screen
//  - Change dayRate screen
//  - Change hiwd screen
//  - Change payment freqency screen
//  - Change retention amount sceen

// Screens that can share functionality....
//  - dayRate, hiwd and retention amount all live in the same place and have the same data type so they can share a common widget, will just pass in different values to the constructor
//  - All the others have slightly diffrent data types or methods for editing the value


// Full name will just have an input and a button that is enabled when the value is changed
// Email will have to call firebase.auth and check if it is unique etc
// Password will need to be re-authed and other checks made
// Day rate, hiwd and retention amount will have a number only input can re-use the ones from the wage info page
// Payment frequency will use the "MyDropDown" widget

// i do wan the ui/ page for each to look th same ie, a scaffold with a title and and a body. All the same paddings and colours etc....AccountScreen
// So could have a wrapper for all of the comps and a switch that handles which widget is diplayed in the body of the scaffold
// Each widget will then just return a Column with the data inside
// Wrapper name: EditAccountValuesWrapper
//  
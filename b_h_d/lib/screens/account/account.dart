import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Account"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: <Widget>[
            // SizedBox(
            //   height: 20,
            // ),
            Text(
              "Account Information",
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
                    "Full Name",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Darren Stallard",
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
                    "Email",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "DarrenStallard@gmial.com",
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
                        "£220",
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
                        "8",
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
                      // TODO drop down button
                      Text(
                        "Weekly",
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
                        "3%",
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
          ],
        ));
  }
}

import 'package:b_h_d/screens/account/account.dart';
import 'package:b_h_d/screens/home/emailNotVerified.dart';
import 'package:b_h_d/screens/home/emailVerified.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  bool emailVerified = false;
  Home({required this.emailVerified});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Auth _auth = Provider.of<Auth>(context);

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
      drawer: _auth.user.hasEnteredWageInfo
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: 140,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                      ),
                      child: Text('Drawer Header'),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Account',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Tools',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: widget.emailVerified ? EmailVerified() : EmailNotVerified(),
    );
  }
}

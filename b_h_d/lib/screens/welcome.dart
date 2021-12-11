import 'package:b_h_d/screens/signUp.dart';
import 'package:b_h_d/utils/customPageRoute.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              width: 200,
              child: Image(
                image: AssetImage("assets/images/ot_logo.png"),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            RichText(
              text: TextSpan(
                text: "Welcome to only trades ",
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "ReadexPro", fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: "Diary",
                    style: TextStyle(
                      color: Colors.orange[400],
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(
                      child: SignUp(),
                    ),
                  );
                },
                child: Text("Register"),
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:b_h_d/screens/account/account.dart';
import 'package:b_h_d/screens/home/emailNotVerified.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/customPageRoute.dart';
import 'package:flutter/material.dart';

class HasNotEnteredWageInfo extends StatelessWidget {
  const HasNotEnteredWageInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Text(
            "Your wage info has not yet been added! You will be unable to use the diary and other tools until this is entered.",
            style: MyFormStyles.textFormStyle(),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountScreen(),
                  ),
                );
              },
              child: Text("Go to account"),
            ),
          )
        ],
      ),
    );
  }
}

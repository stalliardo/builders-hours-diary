import 'package:b_h_d/screens/account/account.dart';
import 'package:b_h_d/screens/home/emailNotVerified.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/customPageRoute.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HasNotEnteredWageInfo extends StatelessWidget {
  const HasNotEnteredWageInfo({Key? key}) : super(key: key);

  final String _emptyFieldError = "Fields cannot be blank";

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(14, 20, 14, 30),
      children: <Widget>[
        Text(
          "Wage Information",
          style: MyFormStyles.formTitle(),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          "Your wage info has not yet been added! You will be unable to use the diary and other tools until this is entered.",
          style: MyFormStyles.textFormStyle(),
        ),
        SizedBox(
          height: 40,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return _emptyFieldError;
            }
            return null;
          },
          decoration: InputDecoration(labelText: "Day rate"),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(StringFormatting.onlyNumbersAndOneDecimal())],
          style: MyFormStyles.textFormStyle(),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return _emptyFieldError;
            }
            return null;
          },
          decoration: InputDecoration(labelText: "Payment frequency"),
          style: MyFormStyles.textFormStyle(),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return _emptyFieldError;
            }
            return null;
          },
          decoration: InputDecoration(labelText: "Paid hours in work day"),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(StringFormatting.onlyNumbersAndOneDecimal())],
          style: MyFormStyles.textFormStyle(),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return _emptyFieldError;
            }
            return null;
          },
          decoration: InputDecoration(labelText: "Retention amount %"),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.allow(StringFormatting.onlyNumbersAndOneDecimal())],
          style: MyFormStyles.textFormStyle(),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
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
      ],
    );
  }
}

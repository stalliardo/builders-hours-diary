import 'package:b_h_d/screens/account/account.dart';
import 'package:b_h_d/screens/home/emailNotVerified.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/customPageRoute.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HasNotEnteredWageInfo extends StatefulWidget {
  HasNotEnteredWageInfo({Key? key}) : super(key: key);

  @override
  _HasNotEnteredWageInfoState createState() => _HasNotEnteredWageInfoState();
}

class _HasNotEnteredWageInfoState extends State<HasNotEnteredWageInfo> {
  final String _emptyFieldError = "Fields cannot be blank";
  final paymentFrequencyOptions = ["Weekly", "Fortnightly", "Mothly"];
  String dropDownValue = "Weekly";

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
        //////
        ///
        ///

        Container(
          // margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.4,
              color: Colors.blueGrey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.fromLTRB(16, 0, 10, 0),

          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              style: TextStyle(color: Colors.white),
              value: dropDownValue,
              items: paymentFrequencyOptions
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  dropDownValue = value!;
                });
              },
              isExpanded: true,
              iconEnabledColor: Colors.white,
              iconSize: 24,
            ),
          ),
        ),

        ////
        ///
        ///
        ///
        ///
        ///
        ///
        ///
        ///
        ///
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

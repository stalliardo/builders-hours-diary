import 'package:b_h_d/screens/account/account.dart';
import 'package:b_h_d/screens/home/emailNotVerified.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/customPageRoute.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:b_h_d/widgets/myButtons.dart';
import 'package:b_h_d/widgets/myDropDownButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HasNotEnteredWageInfo extends StatefulWidget {
  HasNotEnteredWageInfo({Key? key}) : super(key: key);

  @override
  _HasNotEnteredWageInfoState createState() => _HasNotEnteredWageInfoState();
}

class _HasNotEnteredWageInfoState extends State<HasNotEnteredWageInfo> {
  final String _emptyFieldError = "Fields cannot be blank";
  String dropDownValue = "Weekly";
  String? dayRate;
  String? hoursInWorkDay;
  String? retentionAmount;

  final paymentFrequencyOptions = ["Weekly", "Fortnightly", "Mothly"];
  final _formKey = GlobalKey<FormState>();

  onItemSelected(String value) {
    setState(() {
      dropDownValue = value;
    });
  }

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
        Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return _emptyFieldError;
                    }
                    if (int.parse(value) < 1) {
                      return "Eh? £0 a day?";
                    }

                    if (StringFormatting.startsWithAZero(value)) {
                      return "Values can't start with a 0";
                    }

                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      dayRate = value;
                    });
                  },
                  decoration: InputDecoration(labelText: "Day rate"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(StringFormatting.onlyNumbersAndOneDecimal())],
                  style: MyFormStyles.textFormStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
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
                  child: MyDropDownButton(
                    items: paymentFrequencyOptions,
                    selected: dropDownValue,
                    valueReturned: onItemSelected,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return _emptyFieldError;
                    }
                    if (int.parse(value) < 1) {
                      return "0 hours a day is not valid";
                    }
                    if (int.parse(value) > 24) {
                      return "There's not that many hours in a day :)";
                    }
                    if (StringFormatting.startsWithAZero(value)) {
                      return "Values can't start with a 0";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      hoursInWorkDay = value;
                    });
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
                    if (StringFormatting.startsWithAZero(value) && value.length > 1) {
                      return "Values can't start with a 0";
                    }
                    if (int.parse(value) > 100) {
                      return "Retention can't be greater than 100";
                    }

                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      retentionAmount = value;
                    });
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
                    if (_formKey.currentState!.validate()) {
                      print("dr = $dayRate");
                      print("paymentF = $dropDownValue");
                      print("hiwd = $hoursInWorkDay");
                      print("ra = $retentionAmount");

                      // TODO parse to doubles before sending to the db

                      // Now get the values for each and call some update method in the database
                      // Also need a stream for listening to changes on the user model
                      // And what about checking for dirty values when the user presses back???
                    }
                  },
                  child: Text("Save Information"),
                ),
              ],
            ))
      ],
    );
  }
}

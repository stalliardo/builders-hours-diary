import 'package:b_h_d/screens/account/account.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/services/database.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:b_h_d/widgets/myDropDownButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HasNotEnteredWageInfo extends StatefulWidget {
  final String uid;
  HasNotEnteredWageInfo({Key? key, required this.uid}) : super(key: key);

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
                  if (double.parse(value) < 1) {
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
                  if (double.parse(value) < 1) {
                    return "0 hours a day is not valid";
                  }
                  if (double.parse(value) > 24) {
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
                keyboardType: TextInputType.numberWithOptions(),
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
                  if (double.parse(value) > 100) {
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
                onPressed: () async {
                  print("onPressed called");
                  if (_formKey.currentState!.validate()) {
                    print("Form is valid called");
                    StatusCode _result = await MyDatabase().addInitialUserWageInfo(widget.uid, dropDownValue, double.parse(dayRate!), double.parse(hoursInWorkDay!), double.parse(retentionAmount!));

                    if (_result == StatusCode.ERROR) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("There was a problem saving your information! Please try again"),
                        ),
                      );
                    }

                    // TODO parse to doubles before sending to the db - DONE

                    // Now get the values for each and call some update method in the database - DONE
                    // Also need a stream for listening to changes on the user model - DONE
                    // And what about checking for dirty values when the user presses back???
                  }
                },
                child: Text("Save Information"),
              ),
            ],
          ),
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
            child: Text("Go to account"))
      ],
    );
  }
}

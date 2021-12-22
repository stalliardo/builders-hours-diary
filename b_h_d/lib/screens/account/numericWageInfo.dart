import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/services/database.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericWageInfo extends StatefulWidget {
  String propertyValue;
  String uid;
  String propertyName; // ie dayRate, retentionAmount...
  String labelText;
  NumericWageInfo({Key? key, required this.uid, required this.propertyValue, required this.propertyName, required this.labelText}) : super(key: key);

  @override
  _NumericWageInfoState createState() => _NumericWageInfoState();
}

class _NumericWageInfoState extends State<NumericWageInfo> {
  final _formKey = GlobalKey<FormState>();
  String newValue = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Fields cannot be blank";
              }
              if ((widget.propertyName == "dayRate" || widget.propertyName == "hoursInWorkDay") && double.parse(value) < 1) {
                return "alue can't be zero";
              }

              if (StringFormatting.startsWithAZero(value)) {
                return "Values can't start with a 0";
              }

              return null;
            },
            onChanged: (value) {
              setState(() {
                newValue = value;
              });
            },
            decoration: InputDecoration(labelText: widget.labelText),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(StringFormatting.onlyNumbersAndOneDecimal())],
            style: MyFormStyles.textFormStyle(),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  StatusCode _result = await MyDatabase().updateSingleField(
                    widget.uid,
                    {"${widget.propertyName}": double.parse(newValue)},
                  );
                  if (_result == StatusCode.ERROR) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("An error occured please try again!"),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                  }
                }
              },
              child: Text("Save"),
            ),
          )
        ],
      ),
    );
  }
}

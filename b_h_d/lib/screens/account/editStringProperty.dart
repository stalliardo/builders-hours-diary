import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/services/database.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:b_h_d/widgets/myDropDownButton.dart';
import 'package:flutter/material.dart';

class EditStringProperty extends StatefulWidget {
  String propertyValue;
  String propertyName;
  String labelText;
  String uid;
  bool isSelectMenu;
  EditStringProperty({
    Key? key,
    required this.uid,
    required this.propertyValue,
    required this.propertyName,
    required this.labelText,
    required this.isSelectMenu,
  }) : super(key: key);

  @override
  _EditStringPropertyState createState() => _EditStringPropertyState();
}

class _EditStringPropertyState extends State<EditStringProperty> {
  final _formKey = GlobalKey<FormState>();
  String newValue = "";
  bool _isSelectMenu = false;
  String dropDownValue = "Weekly";

  final paymentFrequencyOptions = ["Weekly", "Fortnightly", "Mothly"];

  onItemSelected(String value) {
    setState(() {
      dropDownValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    dropDownValue = widget.propertyValue;
  }

  @override
  Widget build(BuildContext context) {
    _isSelectMenu = widget.isSelectMenu;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _isSelectMenu
              ? Container(
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
                )
              : TextFormField(
                  initialValue: widget.propertyValue,
                  onChanged: (value) {
                    setState(() {
                      newValue = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Fields cannot be blank";
                    }
                    if (StringFormatting.toTitleCase(value) == widget.propertyValue) {
                      return "Name must be different";
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: widget.labelText),
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
                  String value = newValue;

                  if (widget.propertyName == "fullName") {
                    value = StringFormatting.toTitleCase(newValue);
                  }

                  if (_isSelectMenu) {
                    value = dropDownValue;
                  }

                  StatusCode _result = await MyDatabase().updateSingleField(
                    widget.uid,
                    {widget.propertyName: value},
                  );
                  if (_result == StatusCode.ERROR) {
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

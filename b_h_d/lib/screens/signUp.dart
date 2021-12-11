import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:b_h_d/widgets/myButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String _emptyFieldError = "Fields cannot be blank";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.fromLTRB(10, 30, 20, 10),
              children: [
                MyButtons().customBackButton(() {
                  Navigator.pop(context);
                }),
                Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return _emptyFieldError;
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Full name"),
                      // decoration: MyFormStyles.textFormFieldInputDecoration("Full name"),
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
                      decoration: InputDecoration(labelText: "Email"),
                      style: MyFormStyles.textFormStyle(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return _emptyFieldError;
                        }
                        if (value.length < 8) {
                          return "Passwords must be 8 a minimum of 8 chars";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                      style: MyFormStyles.textFormStyle(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return _emptyFieldError;
                        }
                        if (value != _passwordController.text) {
                          return "Passwords must match";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Confirm Password"),
                      obscureText: true,
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
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processindg Data')),
                            );
                          }
                        },
                        child: Text("Submit"))
                  ],
                ),
              ],
            )),
      ),
    );
  }
}


// TODO - Add appropriate valiadtions for each field
// TODO - Add a dropDown Button for the payment frequency field
// TODO - Handle onSave clicked
// TODO - Add button theme to MyTheme class
// TODO - Convert the numeric values that are still strings to doubles as this is the data type they will be saved in the DB as
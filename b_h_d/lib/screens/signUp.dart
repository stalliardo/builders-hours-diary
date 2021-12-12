import 'package:b_h_d/screens/root.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/utils/stringFormatting.dart';
import 'package:b_h_d/widgets/myButtons.dart';
import 'package:email_validator/email_validator.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  String _emptyFieldError = "Fields cannot be blank";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(10, 20, 0, 30),
          child: MyButtons.customBackButton(
            () {
              Navigator.pop(context);
            },
          ),
        ),
        Text(
          "Register",
          style: MyFormStyles.formTitle(),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: _fullNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return _emptyFieldError;
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: "Full name"),
                  style: MyFormStyles.textFormStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return _emptyFieldError;
                    } else if (!EmailValidator.validate(value)) {
                      print("The email is valie");
                      return "Please enter a valid email";
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
                  decoration: InputDecoration(labelText: "Confirm password"),
                  obscureText: true,
                  style: MyFormStyles.textFormStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                // TextFormField(
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return _emptyFieldError;
                //     }
                //     return null;
                //   },
                //   decoration: InputDecoration(labelText: "Payment frequency"),
                //   style: MyFormStyles.textFormStyle(),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // TextFormField(
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return _emptyFieldError;
                //     }
                //     return null;
                //   },
                //   decoration: InputDecoration(labelText: "Day rate"),
                //   keyboardType: TextInputType.number,
                //   inputFormatters: [FilteringTextInputFormatter.allow(StringFormatting.onlyNumbersAndOneDecimal())],
                //   style: MyFormStyles.textFormStyle(),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // TextFormField(
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return _emptyFieldError;
                //     }
                //     return null;
                //   },
                //   decoration: InputDecoration(labelText: "Paid hours in work day"),
                //   keyboardType: TextInputType.number,
                //   inputFormatters: [FilteringTextInputFormatter.allow(StringFormatting.onlyNumbersAndOneDecimal())],
                //   style: MyFormStyles.textFormStyle(),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // TextFormField(
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return _emptyFieldError;
                //     }
                //     return null;
                //   },
                //   decoration: InputDecoration(labelText: "Retention amount %"),
                //   keyboardType: TextInputType.number,
                //   inputFormatters: [FilteringTextInputFormatter.allow(StringFormatting.onlyNumbersAndOneDecimal())],
                //   style: MyFormStyles.textFormStyle(),
                // ),

                Container(
                  width: 340,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        StatusCode _result = await Auth().createUserWithEmailAndPassword(_emailController.text, _passwordController.text, _fullNameController.text);

                        if (_result == StatusCode.SUCCESS) {
                          // TODO go to root
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Root()), (route) => false);
                        } else {
                          // TODO display error message
                        }
                      }
                    },
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}


// TODO - Add appropriate valiadtions for each field
// TODO - Add a dropDown Button for the payment frequency field
// TODO - Handle onSave clicked
// TODO - Add button theme to MyTheme class
// TODO - Convert the numeric values that are still strings to doubles as this is the data type they will be saved in the DB as
// TODO - Change the font size of the inputs, they're massive.
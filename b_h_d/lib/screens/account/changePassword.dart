import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  String uid;
  ChangePassword({Key? key, required this.uid}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  String currentPassword = "";
  String newPassword = "";
  String confirmPassword = "";

  bool _isObscureCurrent = true;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    Auth _auth = Provider.of<Auth>(context);

    return ListView(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    currentPassword = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Fields cannot be empty";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Current Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscureCurrent ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _isObscureCurrent = !_isObscureCurrent;
                      });
                    },
                  ),
                ),
                obscureText: _isObscureCurrent,
                style: MyFormStyles.textFormStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    newPassword = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Fields cannot be empty";
                  }

                  if (value.length < 8) {
                    return "Passwords must be 8 a minimum of 8 chars";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "New Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                obscureText: _isObscure,
                style: MyFormStyles.textFormStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    confirmPassword = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Fields cannot be empty";
                  }

                  if (value != newPassword) {
                    return "Passwords do not match!";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
                obscureText: _isObscure,
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
                      String _result = await _auth.changeUsersPassword(currentPassword, newPassword);
                      if (_result != "Success") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(_result),
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
        )
      ],
    );
  }
}

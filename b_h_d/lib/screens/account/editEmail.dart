import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditEmail extends StatefulWidget {
  String propertyValue;
  String uid;
  EditEmail({Key? key, required this.uid, required this.propertyValue}) : super(key: key);

  @override
  _EditEmailState createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  final _formKey = GlobalKey<FormState>();
  String newEmail = "";
  bool _isObscure = true;
  String password = "";

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
                initialValue: widget.propertyValue,
                onChanged: (value) {
                  setState(() {
                    newEmail = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Fields cannot be blank";
                  }
                  if (!EmailValidator.validate(value)) {
                    return "Please enter a valid email";
                  }
                  if (newEmail == widget.propertyValue) {
                    return "Email has to be different";
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
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Fields cannot be empty";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Password",
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
                      print("Valid called!!!!");
                      String _result = await _auth.updateUsersEmail(widget.propertyValue, password, newEmail);
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

import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.fromLTRB(20, 60, 20, 10),
              children: [
                Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                      decoration: MyFormStyles.textFormFieldInputDecoration("Full name"),
                      style: MyFormStyles.textFormStyle(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                      decoration: MyFormStyles.textFormFieldInputDecoration("Email"),
                      style: MyFormStyles.textFormStyle(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter some text";
                        }
                        return null;
                      },
                      decoration: MyFormStyles.textFormFieldInputDecoration("Password"),
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

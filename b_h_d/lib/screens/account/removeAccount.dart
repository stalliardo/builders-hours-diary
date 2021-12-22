import 'package:b_h_d/screens/welcome.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoveAccount extends StatefulWidget {
  RemoveAccount({Key? key}) : super(key: key);

  @override
  _RemoveAccountState createState() => _RemoveAccountState();
}

class _RemoveAccountState extends State<RemoveAccount> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  String password = "";

  @override
  Widget build(BuildContext context) {
    Auth _auth = Provider.of<Auth>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Delete Account"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(16, 100, 16, 16),
          child: ListView(
            children: [
              Text(
                "Warning!",
                style: TextStyle(color: Colors.red, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Text(
                "You are about to delete your account! This will remove all of your saved data and cannot be undone.",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String _result = await _auth.deleteUsersAccount(password);
                            if (_result != "Success") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(_result),
                                ),
                              );
                            } else {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WelcomeScreen()), (route) => false);
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
          ),
        ));
  }
}

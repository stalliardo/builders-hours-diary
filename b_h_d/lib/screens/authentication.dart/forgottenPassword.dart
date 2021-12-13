import 'package:b_h_d/screens/root.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/widgets/myButtons.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ForgottenPassword extends StatefulWidget {
  ForgottenPassword({Key? key}) : super(key: key);

  @override
  _ForgottenPasswordState createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  String _emptyFieldError = "Email cannot be blank";

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
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
          "Password reset",
          style: MyFormStyles.formTitle(),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Enter your email and we'll send you a password reset code.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
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
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return _emptyFieldError;
                    } else if (!EmailValidator.validate(value)) {
                      return "Please enter a valid email";
                    }

                    return null;
                  },
                  decoration: InputDecoration(labelText: "Email"),
                  style: MyFormStyles.textFormStyle(),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 340,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        StatusCode _result = await Auth().sendForgottonPasswordEmail(_emailController.text);

                        if (_result == StatusCode.SUCCESS) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Root()), (route) => false);
                        } else if (_result == StatusCode.USER_DOES_NOT_EXIST) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Email address not found"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("There was a problem sending the email. Please try again."),
                            ),
                          );
                        }

                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: Text("Reset password"),
                  ),
                ),
                _isLoading
                    ? Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          CircularProgressIndicator(
                            value: null,
                          ),
                        ],
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
        )
      ],
    ));
  }
}

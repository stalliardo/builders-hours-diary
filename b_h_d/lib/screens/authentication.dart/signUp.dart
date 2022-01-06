import 'package:b_h_d/screens/root.dart';
import 'package:b_h_d/services/authentication.dart';
import 'package:b_h_d/styles/text/formStyles.dart';
import 'package:b_h_d/widgets/myButtons.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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

  bool _isLoading = false;
  bool _isObscure = true;

  @override
  void dispose() {
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
                  width: 340,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        StatusCode _result = await Auth().createUserWithEmailAndPassword(_emailController.text, _passwordController.text, _fullNameController.text);

                        if (_result == StatusCode.SUCCESS) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Root()), (route) => false);
                        } else {
                          // TODO display error message
                        }

                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: Text("Register"),
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

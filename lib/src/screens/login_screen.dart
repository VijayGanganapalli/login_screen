import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginScreenMixin {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              Container(margin: EdgeInsets.only(bottom: 18.0)),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue[200],
      child: Text('Submit'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print("$email and $password");
          formKey.currentState.reset();
        }
      },
    );
  }
}

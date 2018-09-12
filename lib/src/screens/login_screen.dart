import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {

  final formkey = GlobalKey<FormState>();

  String email = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: form(),
    );
  }

  Widget form() {
    return Form(
      key: formkey,
      child: Column(
        children: <Widget>[
          user(),
          pass(),
          spacer(25.0),
          button(),
        ],
      )
    );
  }

  Widget user() {
    return TextFormField(

      keyboardType: TextInputType.emailAddress,

      decoration: new InputDecoration(
        labelText: 'Email',
        icon: Icon(Icons.mail),
        hintText: 'someone@email.com',
      ),

      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget pass() {
    return TextFormField(

      obscureText: false,

      decoration: new InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.lock)
      ),

      validator:validatePassword,
      onSaved: (String value) {
         password = value;
      },
    );

  }

  Widget button() {
    return RaisedButton(
        child: Text('Submit'),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: validation,
    );
  }

  Widget spacer(double size) {
    return Container(
      margin: EdgeInsets.only(top: size),
    );
  }

  void validation() {

    FormState state = formkey.currentState;

    bool isValid = state.validate();

    if(isValid) {
      state.save();
      print('time to post the $email and $password to API');
    }
  }
}
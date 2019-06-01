import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget signUpButton() {
    return RaisedButton(
      color: Colors.orange[200],
      child: Text('Sign Up'),
      onPressed: () {},
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.orange[700],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget passwordTextFromField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password :',
        labelStyle: TextStyle(color: Colors.orange[900]),
        hintText: 'More 6 Charactor',
        helperText: 'Please Type Password Here !!',
        helperStyle:
            TextStyle(color: Colors.orange[400], fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget userTextFromField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'User :',
        labelStyle: TextStyle(color: Colors.orange[900]),
        hintText: 'Not Blank',
        helperText: 'Please Type User Here !!',
        helperStyle:
            TextStyle(color: Colors.orange[400], fontStyle: FontStyle.italic),
      ),
    );
  }

  showLogo() {
    return Image.asset('images/logo.png');
  }

  Widget showAppName() {
    return Text(
      'Tae Food Shop',
      style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.orange[900],
          fontFamily: 'Pacifico'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Colors.orange[200]], begin: Alignment(-1, -1)),
        ),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment(0, -1),
        child: Column(children: <Widget>[
          Container(
            width: 150.0,
            height: 150.0,
            child: showLogo(),
          ),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: showAppName(),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0),
            child: userTextFromField(),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0),
            child: passwordTextFromField(),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: signInButton(),
                ),
                Expanded(
                  child: signUpButton(),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

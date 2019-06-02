import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taefoodshop/models/user_model.dart';
import 'package:taefoodshop/screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import 'package:taefoodshop/screens/show_food_listview.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String user, password;

  Widget signUpButton(BuildContext context) {
    return RaisedButton(
      color: Colors.orange[200],
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click Sign Up');

        //Create Route
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget signInButton(BuildContext context) {
    return RaisedButton(
      color: Colors.orange[700],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          checkUserAndPass(context);
        }
      },
    );
  }

  void checkUserAndPass(BuildContext context) async {
    String urlPHP =
        'https://www.androidthai.in.th/tae/getUserWhereUserTae.php?isAdd=true&User=$user';
    var response = await get(urlPHP);
    var result = json.decode(response.body);
    print(result);

    // Check user
    if (result.toString() == 'null') {
      showSnackBar('No $user in my Database');
    } else {
      for (var objJSON in result) {
        UserModel userModel = UserModel.fromJSHON(objJSON);

        print('password = $password');
        print('True Password = ${userModel.password.toString()}');

        if (password.trim() == (userModel.password.toString())) {
          String nameUser = userModel.name.toString();
          var showFoodRoute = MaterialPageRoute(
              builder: (BuildContext context) => ShowFoodListView(nameString: nameUser,));
              Navigator.of(context).pushAndRemoveUntil(showFoodRoute, (Route<dynamic> route) => false);
        } else {
          showSnackBar('Password False Please Try again');
        }
      }
    }
  }

  void showSnackBar(String message) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.orange[900],
      duration: Duration(seconds: 8),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.yellowAccent,
        onPressed: () {},
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget passwordTextFromField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.yellowAccent),
        labelText: 'Password :',
        labelStyle: TextStyle(color: Colors.orange[900]),
        hintText: 'More 6 Charactor',
        helperText: 'Please Type Password Here !!',
        helperStyle:
            TextStyle(color: Colors.orange[400], fontStyle: FontStyle.italic),
      ),
      validator: (String value) {
        if (checkSpace(value)) {
          return 'Password not Space';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget userTextFromField() {
    return TextFormField(
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.yellowAccent),
        labelText: 'User :',
        labelStyle: TextStyle(color: Colors.orange[900]),
        hintText: 'Not Blank',
        helperText: 'Please Type User Here !!',
        helperStyle:
            TextStyle(color: Colors.orange[400], fontStyle: FontStyle.italic),
      ),
      validator: (String value) {
        if (checkSpace(value)) {
          return 'User not Empty';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  bool checkSpace(String value) {
    bool result = false;
    if (value.length == 0) {
      result = true;
    }

    return result;
  }

  Widget showLogo() {
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
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.orange[200]],
                begin: Alignment(-1, -1)),
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
                    child: signInButton(context),
                  ),
                  Expanded(
                    child: signUpButton(context),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

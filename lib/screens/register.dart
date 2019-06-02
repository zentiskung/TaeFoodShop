import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final formKey = GlobalKey<FormState>();

  Widget uploadButton() {
    return IconButton(
      icon: Icon(
        Icons.cloud_upload,
        size: 36.0,
      ),
      onPressed: () {
        print('You Click Upload');
        if (formKey.currentState.validate()) {
          
        }
      },
    );
  }

  Widget nameTextFromField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: Colors.orange[900],
        ),
        labelText: ': Name',
        helperText: 'Name in English',
        helperStyle:
            TextStyle(color: Colors.orange[200], fontStyle: FontStyle.italic),
        labelStyle: TextStyle(fontSize: 18.0, color: Colors.orange[900]),
      ),
      validator: (String value) {
        if (value.length == 0) {
          return 'Plase Fill Name in The Blank';
          
        }
      },
    );
  }

  Widget userTextFromField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.account_circle,
          size: 36.0,
          color: Colors.blue[700],
        ),
        labelText: 'User :',
        labelStyle: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
        helperText: 'Type User in the Blank',
        helperStyle:
            TextStyle(color: Colors.blue[400], fontStyle: FontStyle.italic),
      ), validator: (String value){
        if (value.length == 0) {
          return 'Please Tyoe Your User Here !!';
        }
      },
    );
  }

  Widget passwordTextFromField() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          color: Colors.red[700],
          size: 36.0,
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(fontSize: 18.0, color: Colors.red[700]),
        helperText: 'Password More 6 Charator',
        helperStyle:
            TextStyle(color: Colors.red[400], fontStyle: FontStyle.italic),
      ), validator: (String value){
        if (value.length <=5) {
          return 'Please Type Password more 6 Charactor';
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(top: 60.0, left: 50.0, right: 50.0),
          alignment: Alignment(0, -1),
          child: Column(
            children: <Widget>[
              nameTextFromField(),
              userTextFromField(),
              passwordTextFromField()
            ],
          ),
        ),
      ),
    );
  }
}

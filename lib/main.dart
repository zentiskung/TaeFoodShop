import 'package:flutter/material.dart';
import 'package:taefoodshop/screens/authen.dart';
import 'package:taefoodshop/screens/register.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authen(),
    );
  }
}

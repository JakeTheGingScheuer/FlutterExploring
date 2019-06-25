import 'package:flutter/material.dart';
import 'package:my_app/home.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'this is the title',
      home: Home()
    );
  }
}
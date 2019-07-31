import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/data_storage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataStorage()
    );
  }
}
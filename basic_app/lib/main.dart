import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Hello World')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
            ),
            child: Text('One')),
          Container(
            decoration: BoxDecoration(
            color: Colors.green,
            ),
            child: Text('Two'))]
          ),

    )
  ));
}
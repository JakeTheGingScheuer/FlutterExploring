import 'package:flutter/material.dart';

class Counter extends State {

  int value = 0;

  void addToValue() {
    value++;
  }

  void renderCount() {
    setState(() {
      addToValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
        body: new Center(
          child: new Text('Current count: $value')
        ),
        floatingActionButton: new FloatingActionButton(onPressed: renderCount)
    );
  }
}
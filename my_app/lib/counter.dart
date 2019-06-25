import 'package:flutter/material.dart';

//So for good measure, I should have a counter widget app which does render count and build on it's own.
//But that is yet another layer of wrappers

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
import 'package:flutter/material.dart';
import 'counter.dart';

//CounterState holds the state and renders the object

class CounterState extends State {

  Counter _counter;

  CounterState() {
    _counter = new Counter();
  }

  void renderCount() {
    setState(() {
      _counter.addToValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
        body: new Center(
          child: new Text('Current count: $_counter.value')
        ),
        floatingActionButton: new FloatingActionButton(onPressed: renderCount)
    );
  }
}
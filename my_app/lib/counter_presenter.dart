import 'package:flutter/material.dart';

import 'counter.dart';

//CounterPresenter does the rendering of our object

class CounterPresenter extends State {

  Counter _counter;

  CounterPresenter() {
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
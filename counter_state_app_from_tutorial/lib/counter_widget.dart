import 'package:flutter/material.dart';
import 'counter_state.dart';

//This is used to create our new instance of a counter that will have state

class CounterWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new CounterState();
  }
}
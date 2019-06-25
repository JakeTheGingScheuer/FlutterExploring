import 'package:flutter/material.dart';
import 'counter.dart';

//This is used to create our new instance which will hold state of our widgets,
//(ANOTHER WRAPPER!!!)
//We only have a counter in this application...
class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new Counter();
  }
}
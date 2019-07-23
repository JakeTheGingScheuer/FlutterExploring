import 'package:flutter/material.dart';

class LocationDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello World')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _section('One', Colors.red),
            _section('TWO', Colors.blue),
            _section('Trois', Colors.yellow),
            _section('QUADCHOPPER', Colors.green)
          ]
      ),
    );
  }
}

Widget _section(String title, Color color){
  return Container(
      decoration: BoxDecoration(
        color: color,
      ),
      child: Text(title));
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/screens/day_screen.dart';

class DayTile extends BlankTile {

  Day day;

  DayTile(this.day);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute( builder: (context) => DayScreen(day)));},
        child: GridTile(
            child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(color: Colors.amberAccent),
                        child: Text(day.dayNumber.toString(), style: TextStyle(fontWeight: FontWeight.w500),)),
                    Container(child: Text('\$'+day.balance.toStringAsFixed(0)))
                  ],
                )
            )));
  }

}

class BlankTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: GridTile(child: Text('')));
  }

}
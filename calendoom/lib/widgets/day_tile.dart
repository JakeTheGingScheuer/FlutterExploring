import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/screens/day_screen.dart';

class DayTile extends BlankTile {

  Day day;
  double runningBalance;
  DayTile(this.day, this.runningBalance);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute( builder: (context) => DayScreen(day)));},
        child: GridTile(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.green), color: ifToday()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(color: Colors.greenAccent),
                        child: Text(day.dayNumber.toString(), style: TextStyle(fontWeight: FontWeight.w500),)),
                    SingleChildScrollView(
                      child: Container(
                          child: Text(
                            '\$'+runningBalance.toStringAsFixed(0),
                            style: TextStyle(fontSize: 10, color: Colors.greenAccent),
                      )),
                    )
                  ],
                )
            )));
  }

  Color ifToday(){
    int dayNumb = int.parse(day.dayNumber);
    DateTime today = DateTime.now();
    DateUtil util = DateUtil();
    String monthToday = util.month(today.month);
    if((dayNumb == today.day)&&(monthToday == day.monthName)){
      return Colors.green;
    } return Colors.black;
  }
}

class BlankTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: GridTile(child: Text('')));
  }
}
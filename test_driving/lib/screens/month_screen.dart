import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/models/calendar.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/month.dart';

import 'day_screen.dart';

class MonthScreen extends StatelessWidget {
  int monthNumber;
  MonthScreen(this.monthNumber);

  @override
  Widget build(BuildContext context) {

    Calendar calendar = Provider.of<Calendar>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Month Screen')),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: ()=> backButtonAction(context, monthNumber)),
                  Text(calendar.months[monthNumber].monthName+' '+calendar.months[monthNumber].year, key: Key('monthTitle'), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: ()=> Navigator.push(context, MaterialPageRoute( builder: (context) => MonthScreen(monthNumber+1))))
                ],
              )),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(12),
            height: 400,
            child: GridView.count(
              key: Key('monthView'),
              crossAxisCount: 7,
              children: dayTiles(calendar.months[monthNumber], context)
            ),
          ),
        ],
      )
    );
  }

  List<GestureDetector> dayTiles(Month month, BuildContext context){
    List<GestureDetector> dayTiles = List<GestureDetector>();
    if(month.days[0].weekdayNumber < 7){
      addBlankTiles(month.days[0].weekdayNumber).forEach((blank) => dayTiles.add(blank));
    }
    month.days.forEach((day) => dayTiles.add(
        dayTile(day, context)
    ));
    return dayTiles;
  }

  List<GestureDetector> addBlankTiles(int weekDay){
    List<GestureDetector> blankTiles = List<GestureDetector>();

    for (int i = 0; i < weekDay; i++){
      blankTiles.add(
          GestureDetector(child: GridTile(child: Text(''))));
    }
    return blankTiles;
  }

  GestureDetector dayTile(Day day, BuildContext context){
    return
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute( builder: (context) => DayScreen(day)));},
          child: GridTile(
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                children: <Widget>[
                  Container(child: Text(day.dayNumber.toString())),
                  Container(child: Text(day.balance.toString()))
                ],
              )
          )));
  }

  void backButtonAction(BuildContext context, int monthNumb) {
    if (Navigator.canPop(context)){
      Navigator.pop(context);
    } else
      Navigator.push(context, MaterialPageRoute( builder: (context) => MonthScreen(0)));
  }
}

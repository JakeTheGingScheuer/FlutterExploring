import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/models/calendar.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/month.dart';

import 'day_screen.dart';

class MonthScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Calendar calendar = Provider.of<Calendar>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Month Screen')),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            height: 600,
            width: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 13,
              itemBuilder: (BuildContext context, int index){
                return monthTile(calendar, index, context);
              },
            )
          ),
        ],
      )
    );
  }

  Container monthTile(Calendar calendar, int index, BuildContext context){
    return Container(
      padding: EdgeInsets.all(12),
      height: 500,
      width: 400,
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            width: 400,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(calendar.months[index].monthName+' '+calendar.months[index].year, key: Key('monthTitle'), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  ])),
          SizedBox(height: 15),
          Container(
            height: 400,
            child: GridView.count(
                key: Key('monthView'),
                crossAxisCount: 7,
                children: dayTiles(calendar.months[index], context)
            ),
          ),
        ],
      ),
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
}

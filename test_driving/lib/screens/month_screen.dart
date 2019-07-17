import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/month.dart';

import 'day_screen.dart';

class MonthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Month month = Provider.of<Month>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Month Screen')),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Text(month.monthName, key: Key('monthTitle'), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(12),
            height: 400,
            child: GridView.count(
              key: Key('monthView'),
              crossAxisCount: 7,
              children: dayTiles(month, context)
            ),
          ),
        ],
      )
    );
  }

  List<GestureDetector> dayTiles(Month month, BuildContext context){
    List<GestureDetector> dayTiles = List<GestureDetector>();

    addBlankTiles(month.days[0].weekday).forEach((blank) => dayTiles.add(blank));

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
              child: Text(day.dayNumber.toString())
          )));
  }
}

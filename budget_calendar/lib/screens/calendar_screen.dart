import 'package:budget_calendar/model/calendar_model.dart';
import 'package:budget_calendar/model/day_model.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'day_screen.dart';

class CalendarScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.headBar(),
      body: CalendarList()
      );
  }
}

class CalendarList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CalendarModel calendarModel = Provider.of<CalendarModel>(context);
    List<Container> dateTiles = makeDateTiles(calendarModel.daysOfTheYear);

    return ListView.builder(
        itemCount: 365,
        itemBuilder: (context, index) {
          return Container(
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all()),
              child: ListTile(
                  contentPadding: EdgeInsets.all(12.0),
                  leading: dateTiles[index],
                  title: Text(
                      getRunningBalance(calendarModel, index),
                      textAlign: TextAlign.end),
                  subtitle: Text('credits and debits go here',
                      style: TextStyle(color: Colors.green),
                      textAlign: TextAlign.end),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => DayScreen(calendarModel.daysOfTheYear[index].dayModel)));})
                );
        });
  }

  List<Container> makeDateTiles(List<Day> daysOfTheYear) {

    List<Container> dateTiles = List<Container>();
    for (int i = 0; i < daysOfTheYear.length; i++) {
      Day eachDay = daysOfTheYear[i];
        dateTiles.add(
          Container(
            height: 75.0,
            width: 75.0,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(eachDay.calendarDate.month, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(eachDay.calendarDate.weekday + ' ' +
                      eachDay.calendarDate.dayNum.toString())
                ]
              )
        ));
    } return dateTiles;
  }

  String getRunningBalance(CalendarModel calendar, int i) {
    var yesterday = DayModel();
    var theDay = calendar.daysOfTheYear[i].dayModel;
    if(i>0){
      yesterday = calendar.daysOfTheYear[i-1].dayModel;
    }
    if(theDay.transactions.length>0) {
      return (theDay.getDailyBalance() + yesterday.getDailyBalance()).toString();
    } else return '0.00';
  }
}
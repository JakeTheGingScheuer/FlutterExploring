import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/models/calendar.dart';
import 'package:test_driving/models/month.dart';
import 'package:test_driving/widgets/day_tile_builder.dart';

class MonthScreen extends StatelessWidget {

  LocalStorage storage;
  List<Container> monthViews;
  MonthScreen(this.storage);

  @override
  Widget build(BuildContext context) {
    Calendar calendar = Provider.of<Calendar>(context);
    calendar.calculateBalance();
    autoSave(calendar);
    monthViews = buildMonthViews(calendar);
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: CupertinoNavigationBar(
              actionsForegroundColor: Colors.green,
              backgroundColor: Colors.black),
        body: Column(
          children: <Widget>[
            SizedBox(height: 80),
            Container(
              key: Key('CalendarView'),
                height: 500,
                width: 400,
                child: PageView (
                  controller: PageController(
                    initialPage: 1
                  ),
                  scrollDirection: Axis.horizontal,
                  children: monthViews
                )
            ),
          ],
        )
    );
  }

  List<Widget> buildMonthViews(Calendar calendar){
    List<Container> monthViews = new List<Container>();
    for(int i = 0; i < 13; i++){
      monthViews.add(monthTile(calendar, i));
    }return monthViews;
  }

  autoSave(Calendar calendar){
    storage.setItem('calendar', calendar.toJson());
  }

  Container monthTile(Calendar calendar, int index) {
    Month month = calendar.months[index];
    DayTileListBuilder buildList = DayTileListBuilder(month, storage);

    return Container(
      padding: EdgeInsets.all(12),
      height: 450,
      width: 400,
      child: Column(
        children: <Widget>[
          Container(
              height: 30,
              width: 400,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    monthYearDisplay(month),
                  ])),
          SizedBox(height: 15),
          Container(
            height: 400,
            child: GridView.count(
                key: Key('monthView'),
                crossAxisCount: 7,
                children: buildList.dayTilesForThisMonth
            ),
          ),
        ],
      ),
    );
  }

  Text monthYearDisplay(Month month) {
    return Text(
        month.monthName + ' ' + month.year.toString(), key: Key('monthTitle'),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green)
    );
  }
}


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

  MonthScreen(this.storage);

  @override
  Widget build(BuildContext context) {
    Calendar calendar = Provider.of<Calendar>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Month Screen'),
          leading: IconButton(
              icon: Icon(Icons.save),
              onPressed:()=> storage.setItem('calendar', calendar.toJson()))),
        body: Column(
          children: <Widget>[
            SizedBox(height: 15),
            Container(
                height: 500,
                width: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return monthTile(calendar, index, context);
                  },
                )
            ),
          ],
        )
    );
  }

  Container monthTile(Calendar calendar, int index, BuildContext context) {

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
        month.monthName + ' ' + month.year, key: Key('monthTitle'),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
    );
  }

}


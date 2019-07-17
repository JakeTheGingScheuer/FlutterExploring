import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/models/month.dart';

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
          Container(
            height: 500,
            child: GridView.count(
              key: Key('monthView'),
              crossAxisCount: 7,
              children: dayTiles(month)
            ),
          ),
        ],
      )
    );
  }

  List<GridTile> dayTiles(Month month){
    List<GridTile> dayTiles = List<GridTile>();
    month.days.forEach((day) => dayTiles.add(GridTile(
      child: Text('17')
    )));
    return dayTiles;
  }
}

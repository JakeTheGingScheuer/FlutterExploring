import 'package:budget_calendar/model/day_model.dart';
import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  DayModel dayModel;
  DateCard(this.dayModel);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all()),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(dayModel.month, style: TextStyle(fontSize: 11)),
              Text(dayModel.dayNumber, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(dayModel.weekday, style: TextStyle(fontSize: 10))
            ]));
  }
}
import 'package:budget_calendar/model/day_model.dart';
import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  DayModel dayModel;
  DateCard(this.dayModel);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 75.0,
        decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all()),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(dayModel.month, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(dayModel.weekday + ' ' +
                  dayModel.dayNumber)
            ]));
  }
}
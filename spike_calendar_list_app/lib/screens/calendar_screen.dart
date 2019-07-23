import 'package:budget_calendar/model/calendar_model.dart';
import 'package:budget_calendar/model/day_model.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:budget_calendar/widgets/date_card.dart';
import 'package:budget_calendar/widgets/day_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.headBar('CALENDOOM'),
      body: CalendarList()
      );
  }
}

class CalendarList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    CalendarModel calendarModel = Provider.of<CalendarModel>(context);
    List<DateCard> dateTiles = makeDateTiles(calendarModel.allDayModels);

    return ListView.builder(
        itemCount: 365,
        itemBuilder: (context, index) {

          DayModel day = calendarModel.allDayModels[index];
          DateCard dateTile = dateTiles[index];
          String balance = getRunningBalance(calendarModel, index);

          return DayTile(day, dateTile, balance);
        });
  }

  List<DateCard> makeDateTiles(List<DayModel> allDayModels) {
    List<DateCard> dateTiles = List<DateCard>();

    for (int i = 0; i < allDayModels.length; i++) {
        dateTiles.add(DateCard(allDayModels[i]));
    } return dateTiles;
  }

  String getRunningBalance(CalendarModel calendar, int index) {
    double runningBalance = 0.00;

    for(int i = 0; i <= index; i++){
      DayModel day = calendar.allDayModels[i];

      if(day.transactions.length>0) {
        runningBalance += day.getDailyBalance();
      }
    }
    return '\$'+runningBalance.toStringAsFixed(2);
  }
}
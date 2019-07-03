import 'package:budget_calendar/model/model.dart';
import 'package:budget_calendar/model/view_model.dart';
import 'package:budget_calendar/redux/actions.dart';
import 'package:budget_calendar/widgets/calendar_day_presenter.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'day_screen.dart';

class CalendarScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.headBar(),
      body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel mainModel) => Container(
          child: CalendarList(mainModel))
        )
      );
  }
}

class CalendarList extends StatelessWidget {
  final ViewModel mainModel;
  List<CalendarDay> dayTiles;

  CalendarList(this.mainModel) {
    dayTiles = new List<CalendarDay>();
    makeCalendar();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 365,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DayScreen(mainModel)
                ));
              },
              child:ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: this.dayTiles[index],
                title: Text(this.mainModel.dailyBalance.toString()),
                subtitle: Text('credits and debits go here'),
              ));}
    );
  }

  void makeCalendar() {
    DateTime today = DateTime.now();
    for(int i = 0; i<365; i++){
      DateTime dayOf = today.add(new Duration(days: i));
      dayTiles.add(new CalendarDay(dayOf.month, dayOf.weekday, dayOf.day));
    }
  }
}
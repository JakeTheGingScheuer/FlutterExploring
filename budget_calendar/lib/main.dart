import 'package:budget_calendar/screens/calendar_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:budget_calendar/model/model.dart';
import 'package:budget_calendar/redux/reducers.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
    );
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          home: CalendarScreen()
      ),
    );
  }
}
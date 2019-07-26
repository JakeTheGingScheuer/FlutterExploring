import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/screens/month_screen.dart';

import 'models/calendar.dart';

class DataStorage extends StatelessWidget{

  final LocalStorage storage = new LocalStorage('calendarData');

  Calendar calendar;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, snapshot) {
          if(snapshot.data != true) {
            calendar = new Calendar();
            storage.setItem('calendar', calendar.toJson());
          }
          calendar = Calendar.fromJson(storage.getItem('calendar'));
          return
                ChangeNotifierProvider(
                  builder: (context) => calendar,
                  child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/',
                  routes: {'/': (context) => MonthScreen()
                }));
        });
  }
}
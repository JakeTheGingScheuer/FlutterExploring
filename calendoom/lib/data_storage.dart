import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/models/month.dart';
import 'package:test_driving/screens/month_screen.dart';

import 'models/calendar.dart';

class DataStorage extends StatelessWidget{

  final LocalStorage storage = new LocalStorage('calendarData');

  @override
  Widget build(BuildContext context) {
    Map<String, Month> monthMap;
    return FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, snapshot) {
          if(snapshot.data != true) {
            Calendar calendar = new Calendar();
            storage.setItem('calendar', calendar.encode());
          }
          JsonCodec codec = JsonCodec();
          monthMap = codec.decode(storage.getItem('calendar'));
          return
                ChangeNotifierProvider(
                  builder: (context) => Calendar(monthsFromDisk: monthMap),
                  child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/',
                  routes: {'/': (context) => MonthScreen(storage)
                }));
        });
  }
}
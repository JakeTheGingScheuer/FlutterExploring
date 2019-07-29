import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/screens/month_screen.dart';

import 'models/calendar.dart';

class DataStorage extends StatelessWidget{

  final LocalStorage storage = new LocalStorage('calendarData');
  bool initialized = false;

  Calendar calendar;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Center(
          child: CircularProgressIndicator(),
        );}
        if (!initialized) {
          calendar = Calendar.fromJson(storage.getItem('calendar'));
//          if(calendar =! null){
//
//          }
        } else {
          calendar = new Calendar();
          storage.setItem('calendar', calendar.toJson());
        }
        initialized = true;
        return
          ChangeNotifierProvider(
              builder: (context) => calendar,
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute: '/',
                  routes: {'/': (context) => MonthScreen(storage)
                }));
        });
  }
}
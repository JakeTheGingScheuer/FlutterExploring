import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_driving/models/calendar.dart';
import 'package:test_driving/screens/month_screen.dart';


class DataStorage extends StatelessWidget {

  final LocalStorage storage = LocalStorage('calendar_storage');
  Calendar calendar;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == true) {
            Map<String, dynamic> data = storage.getItem('calendar');
            setCalendar(data);
            return
              ChangeNotifierProvider(
                builder: (context) => calendar,
                child: MonthScreen(storage)
              );
          } else {
            return Scaffold(
                body: Center(
                    child: CircularProgressIndicator()
                )
            );
          }
        });
  }

  setCalendar(Map<String, dynamic> json) {
    if (json == null) {
      Calendar blankCal = Calendar();
      storage.setItem('calendar', blankCal.toJson());
    } else {
      calendar = Calendar.fromJson(json);
    }
  }
}



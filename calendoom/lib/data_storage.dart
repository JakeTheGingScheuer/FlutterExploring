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
  bool instantiated = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          Map<String, dynamic> json = storage.getItem('calendar');
          checkStorage(json);
          print(json);

          return ChangeNotifierProvider(
              builder: (context) => calendar,
              child: MaterialApp(
                  home: MonthScreen(storage)));
        });
  }

  checkStorage(Map<String, dynamic> json){
    if (json != null) {
      calendar = Calendar.fromJson(json);
    } else {
      calendar = Calendar();
      storage.setItem('calendar', calendar.toJson());
    }
    instantiated = true;
  }
}


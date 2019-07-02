import 'package:budget_calendar/screens/calendar_screen.dart';
import 'package:flutter/material.dart';
import '../styles.dart';

class Common {
  static AppBar headBar() {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text('CaLeNdOoM', style: Styles.headerLarge),
      leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CalendarScreen()));
                }
            );
          }),
    );
  }
}
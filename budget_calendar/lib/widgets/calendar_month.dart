import 'package:flutter/material.dart';
import 'calendar_day.dart';

Widget calendarMonth(){
  return Container(
      child: GridView.count(
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          crossAxisCount: 7,
          children: [
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
            calendarDay('Monday'),
          ]
      )
  );
}

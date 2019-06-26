import 'package:flutter/material.dart';

Widget calendarDay(String dayName) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.blue
      ),
      child: Text(dayName)
  );
}
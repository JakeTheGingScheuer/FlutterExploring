import 'package:flutter/material.dart';
import '../styles.dart';
import 'calendar_screen.dart';

class DayDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        GestureDetector(
            onTap: () {
              Navigator.pop(context, MaterialPageRoute(
                  builder: (context) => CalendarScreen()
              ));
            },
            child:Container(
                color: Colors.black,
                alignment: Alignment(0,0),
                child: Text('DO YOU WANNA DIE?!?', style: Styles.death)
            )
        )
    );
  }
}
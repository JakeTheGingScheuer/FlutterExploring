import 'package:budget_calendar/model/day_model.dart';
import 'package:budget_calendar/screens/day_screen.dart';
import 'package:flutter/material.dart';
import 'date_card.dart';

class DayTile extends StatelessWidget {
  DayModel day;
  DateCard date;
  String balance;
  String credits;
  String debits;

  DayTile(this. day, this.date, this.balance){
    credits = day.getCredits().toStringAsFixed(2);
    debits = day.getDebits().toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        decoration: BoxDecoration(
            border: Border.all()),
        child: ListTile(
            contentPadding: EdgeInsets.all(15.0),
            leading: date,
            title: Container(
                child: Text(
                  balance,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
            trailing: Container(
                width: 70,
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(credits,
                          style: TextStyle(color: Colors.green),
                          textAlign: TextAlign.end
                      ),
                      Text(debits,
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.end)
                    ])),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DayScreen(day)));}));
  }
}
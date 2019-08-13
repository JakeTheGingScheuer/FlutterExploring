import 'package:date_util/date_util.dart';

class Date {
  DateUtil dateUtil = DateUtil();
  static const OFFSET = 2;

  int monthNumber;
  int dayNumber;
  int year;
  int weekdayNumber;
  String weekday;
  String monthName;

  Date(DateTime dateTime){
    DateUtil dateUtil = DateUtil();
    this.monthNumber = dateTime.month;
    this.dayNumber = dateTime.day;
    this.year = dateTime.year;
    this.weekdayNumber = dateTime.weekday;
    this.weekday = dateUtil.day(this.weekdayNumber+OFFSET);
    this.monthName = dateUtil.month(this.monthNumber);
  }

  getTitle() {
    return weekday+' '+monthName+' '+dayNumber.toString()+', '+year.toString();
  }
}
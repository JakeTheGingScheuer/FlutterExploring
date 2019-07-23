class DateFormatted {
  String month;
  String weekday;
  int dayNum;

  DateFormatted(int monthNum, int weekdayNum, this.dayNum) {
    month = monthSymb(monthNum);
    weekday = weekdaySymb(weekdayNum);
  }

  String monthSymb(int monthNum) {
    switch (monthNum) {
      case 1:
        {
          return 'JAN';
        }
      case 2:
        {
          return 'FEB';
        }
      case 3:
        {
          return 'MAR';
        }
      case 4:
        {
          return 'APR';
        }
      case 5:
        {
          return 'MAY';
        }
      case 6:
        {
          return 'JUN';
        }
      case 7:
        {
          return 'JUL';
        }
      case 8:
        {
          return 'AUG';
        }
      case 9:
        {
          return 'SEP';
        }
      case 10:
        {
          return 'OCT';
        }
      case 11:
        {
          return 'NOV';
        }
      case 12:
        {
          return 'DEC';
        }
    }
  }

  String weekdaySymb(int weekdayNum) {
    switch(weekdayNum) {
      case 1:{
        return 'Mon ';
      }
      case 2:{
        return 'Tue ';
      }
      case 3:{
        return 'Wed ';
      }
      case 4:{
        return 'Thu ';
      }
      case 5:{
        return 'Fri ';
      }
      case 6:{
        return 'Sat ';
      }
      case 7:{
        return 'Sun ';
      }
    }
  }
}
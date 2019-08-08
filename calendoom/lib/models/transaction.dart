import 'package:flutter/cupertino.dart';

class Transaction extends ChangeNotifier{
  double value = 0.00;
  String description = 'No Description';
  bool isCredit = false;
  bool isReoccurring = false;
  String transKey = '0';
  int dayNumber;
  int monthNumber;

  Transaction(this.dayNumber, this.monthNumber);

  setDescription(String input){
    description = input;
  }

  setAmount(double input) {
    if(isCredit){
      value = input;
    }
    else{
      value = (input * -1);
    }
  }

  setIsCredit(bool input) {
    isCredit = input;
    if((value < 0) && isCredit){
      value *= -1;
    }
  }

  setIsReoccurring(bool input) {
    isReoccurring = input;
  }

  setTransKey(int number){
    transKey = number.toString();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map();
    map['dayNumber'] = dayNumber;
    map['monthNumber'] = monthNumber;
    map['description'] = description;
    map['value'] = value;
    map['isCredit'] = isCredit;
    map['isReoccurring'] = isReoccurring;

    return map;
  }

  Transaction.fromJson(Map<String, dynamic> json){
    monthNumber =json['monthNumber'];
    dayNumber =json['dayNumber'];
    description = json['description'];
    value = json['value'];
    isCredit = json['isCredit'];
    isReoccurring = json['isReoccurring'];
  }
}
import 'package:flutter/cupertino.dart';


class Transaction extends ChangeNotifier{
  double value = 0.00;
  String description = 'description here';
  bool isCredit = false;
  bool isReoccurring = false;
  String transKey = '0';

  Transaction();

  void setDescription(String input){
    description = input;
  }

  void setAmount(double input) {
    if(isCredit){
      value = input;
    }
    else{
      value = (input * -1);
    }
  }

  void setIsCredit(bool input) {
    isCredit = input;
    if((value < 0) && isCredit){
      value *= -1;
    }
  }

  void setIsReoccurring(bool input) {
    isReoccurring = input;
  }

  void setTransKey(int number){
    transKey = number.toString();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map();
    map['description'] = description;
    map['value'] = value;
    map['isCredit'] = isCredit;
    map['isReoccurring'] = isReoccurring;

    return map;
  }

  Transaction.fromJson(Map<String, dynamic> json){
    description = json['description'];
    value = json['value'];
    isCredit = json['isCredit'];
    isReoccurring = json['isReoccurring'];
  }
}
import 'package:flutter/cupertino.dart';

class Transaction extends ChangeNotifier{
  double value = 0.00;
  String description = 'description here';
  bool isCredit = false;
  bool isReoccuring = false;

  void setDescription(String input){
    description = input;
    notifyListeners();
  }

  void setAmount(double input) {
    if(isCredit){
      value = input;
    }
    else{
      value = (input * -1);
    }
    notifyListeners();
  }

  void setIsCredit(bool input) {
    isCredit = input;
    if((value < 0) && isCredit){
      value *= -1;
    }
    notifyListeners();
  }

  void setIsReoccuring(bool input) {
    isReoccuring = input;
    notifyListeners();
  }
}
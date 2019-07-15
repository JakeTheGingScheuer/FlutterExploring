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
    value = input;
    notifyListeners();
  }

  void setIsCredit(bool input) {
    isCredit = input;
    notifyListeners();
  }

  setIsReoccuring(bool input) {
    isReoccuring = input;
    notifyListeners();
  }
}
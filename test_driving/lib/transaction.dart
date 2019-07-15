import 'package:flutter/cupertino.dart';

class Transaction extends ChangeNotifier{
  double value = 0.00;
  String description = 'description here';

  void setDescription(String input){
    description = input;
    notifyListeners();
  }

  setAmount(double input) {
    value = input;
    notifyListeners();
  }
}
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Transaction extends ChangeNotifier{
  double value = 0.00;
  String description = 'description here';
  bool isCredit = false;
  bool isReoccurring = false;

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

  void setIsReoccurring(bool input) {
    isReoccurring = input;
    notifyListeners();
  }

//  Transaction.fromJson(Map<String, dynamic> json) {
//    description = json['description'];
//    value = double.parse(json['value']);
//    isCredit = (json['isCredit'] == 'true');
//    isReoccuring = (json['isReoccuring'] == 'true');
//  }

//  final prefs = await SharedPreferences.getInstance();
//  prefs.setString('description', description);
}
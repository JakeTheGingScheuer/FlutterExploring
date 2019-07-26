import 'package:flutter/cupertino.dart';


class Transaction extends ChangeNotifier{
  double value = 0.00;
  String description = 'description here';
  bool isCredit = false;
  bool isReoccurring = false;

  Transaction();

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

  Map<String, dynamic> toJson() =>
      {
        'description': description,
        'value': value,
        'isCredit': isCredit,
        'isReoccuring': isReoccurring
      };

  Transaction.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        value = json['value'],
        isCredit = json['isCredit'],
        isReoccurring = json['isReoccurring'];
}
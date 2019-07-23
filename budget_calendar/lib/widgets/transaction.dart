import 'package:flutter/material.dart';

class Transaction with ChangeNotifier{
  String _description = '';
  double _amount = 0.0;
  bool _isCredit = false;
  bool _reoccuring = false;

  Transaction(this._description, this._amount);

  double get amount => _amount;
  String get description => _description;
  bool get isCredit => _isCredit;
  bool get reoccuring => _reoccuring;

  set isCredit(bool isCredit){
    _isCredit = isCredit;
    if(!_isCredit){
      _amount *= -1;
    }
    notifyListeners();
  }

  set reoccuring(bool reoccuring){
    _reoccuring = reoccuring;
    notifyListeners();
  }

  set description(String text){
    _description = text;
    notifyListeners();
  }

  set amount(double amount){
    _amount = amount;
    notifyListeners();
  }

}
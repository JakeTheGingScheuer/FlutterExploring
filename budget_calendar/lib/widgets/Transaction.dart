import 'package:flutter/material.dart';

class Transaction with ChangeNotifier{
  String _description = '';
  double _amount = 0.0;

  Transaction(this._description, this._amount);

  double get amount => _amount;
  String get description => _description;

  set description(String text){
    _description = text;
    notifyListeners();
  }

  set amount(double amount){
    _amount = amount;
    notifyListeners();
  }

}
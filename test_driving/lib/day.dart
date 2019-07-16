import 'package:flutter/cupertino.dart';
import 'package:test_driving/transaction.dart';

class Day extends ChangeNotifier {
  List<Transaction> transactions = List<Transaction>();
}
import 'package:budget_calendar/widgets/transaction_form.dart';
import 'package:budget_calendar/widgets/app_bar.dart';
import 'package:budget_calendar/widgets/calendar_list.dart';
import 'package:flutter/material.dart';

import 'day_screen.dart';

class TransactionScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(),
        body: TransactionForm()
    );
  }
}
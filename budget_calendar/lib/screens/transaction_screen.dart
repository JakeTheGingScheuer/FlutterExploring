import 'package:budget_calendar/screens/calendar_screen.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';

import 'day_screen.dart';

class TransactionScreen extends StatelessWidget{
  ViewModel model;
  TransactionScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(),
        body: TransactionForm(this.model)
    );
  }
}
class TransactionForm extends StatefulWidget {
  ViewModel model;
  TransactionForm(this.model);

  @override
  State<StatefulWidget> createState() {
    return TransactionFormState();
  }
}

class TransactionFormState extends State<TransactionForm> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'add a transaction'
      ),
      onSubmitted:(String input) {
        widget.model.onAddTransaction(int.parse(input));
        controller.text = '';
      }
    );

  }
  void addToList(String transaction){
    ListTile addIt = new ListTile(title: Text(transaction));
  }
}
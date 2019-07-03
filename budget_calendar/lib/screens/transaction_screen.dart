import 'package:budget_calendar/model/view_model.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget{
  ViewModel dayModel;
  TransactionScreen(this.dayModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(),
        body: TransactionForm(this.dayModel)
    );
  }
}
class TransactionForm extends StatefulWidget {
  ViewModel dayModel;
  TransactionForm(this.dayModel);

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
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        hintText: 'add a transaction'
      ),
      onSubmitted:(String input) {
        widget.dayModel.onAddTransaction(double.parse(input));
        widget.dayModel.onUpdateBalance(double.parse(input));
        controller.text = '';
      }
    );
  }
}
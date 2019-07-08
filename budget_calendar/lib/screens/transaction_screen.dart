import 'package:budget_calendar/model/day_model.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatelessWidget{

  Transaction transaction = Transaction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(),
        body: TransactionForm(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AddButton(),
    );
  }
}

class AddButton extends StatelessWidget {
  Transaction transaction;

  AddButton(this.transaction);

  @override
  Widget build(BuildContext context) {
    var dailyTransactions = Provider.of<DayModel>(context);
    return RaisedButton(
      child: Text('Add To Ledger'),
      color: Colors.red,
      onPressed: () => addToLedger(dailyTransactions, context)
    );
  }

  void addToLedger(DayModel provider, BuildContext context) {
    provider.add(transaction);
    Navigator.pushReplacementNamed(context, '/day');
  }
}

class TransactionForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TransactionFormState();
  }
}

class TransactionFormState extends State<TransactionForm> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Amount:'),
          SizedBox(height: 24),
          TextField(
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'add a transaction'
              )
          ),
        ],
      );
  }
}
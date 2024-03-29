import 'package:budget_calendar/model/day_model.dart';
import 'package:budget_calendar/widgets/transaction.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget{

  DayModel day;
  TransactionScreen(this.day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(day.dayTitle()),
        body: TransactionForm(this.day),
    );
  }
}

class TransactionForm extends StatefulWidget {
  DayModel dayModel;
  TransactionForm(this.dayModel);

  @override
  State<StatefulWidget> createState() {
    return TransactionFormState(dayModel);
  }
}

class TransactionFormState extends State<TransactionForm> {
  DayModel dayModel;
  double transAmount = 0.0;
  String description = '';
  bool isCredit = false;
  bool reoccuring = false;

  TransactionFormState(this.dayModel);

  void setAmount(double input){
    transAmount = input;
  }
  void setDescription(String input){
    description = input;
  }
  void addToLedger(double amount, BuildContext context) {
    Transaction transaction = Transaction(description, amount);
    transaction.isCredit = isCredit;
    transaction.reoccuring = reoccuring;
    dayModel.addTrans(transaction);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return
    Container(padding: EdgeInsets.all(25.0),
    child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        descriptionField(),
        amountField(),
        SwitchListTile(
          title: Text('Debit(-) / Credit(+)'),
          value: isCredit,
          onChanged: (bool value) {setState(() {
            isCredit = value;
          });},
        ),
        SwitchListTile(
          title: Text('Reoccuring Payment'),
          value: reoccuring,
          onChanged: (bool value) {setState(() {
            reoccuring = value;
          });},
        ),
        SizedBox(height: 10),
        RaisedButton(
            child: Text('Add To Ledger'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () => addToLedger(this.transAmount, context)
        )
      ],
    ));
  }
  Container descriptionField() {
    return Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text('Description',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            TextField(
              keyboardAppearance: Brightness.dark,
              decoration: InputDecoration(
                  hintText: 'Rent, Electric Bill, etc.'
              ),
              onChanged: (input) => setDescription(input),
            ),
          ],
        )
    );
  }

  Container amountField(){
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Text('Amount', style:TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
          SizedBox(height: 10),
          TextField(
            keyboardAppearance: Brightness.dark,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: '\$0.00'
            ),
            onChanged: (input) => setAmount(double.parse(input)),
          ),
          SizedBox(height: 80)
        ],
      )
    );
  }
}
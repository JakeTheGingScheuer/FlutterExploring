import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/transaction.dart';

class TransactionWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Transaction transaction = Provider.of<Transaction>(context);

    return Column(
        children: <Widget>[
          SizedBox(height: 40),
          Text('Description', style: TextStyle(fontSize: 20)),
          descriptionInput(transaction),
          Text('Amount', style: TextStyle(fontSize: 20)),
          amountInput(transaction),
          creditDebitSwitch(transaction),
          reoccuringSwitch(transaction)
        ]
    );
  }

  Container descriptionInput(Transaction transaction){
    return Container(
        padding: EdgeInsets.all(30),
        child:CupertinoTextField(
            placeholder: 'Rent, electric, payday, etc.',
            key: Key('descriptionInput'),
            onChanged: (input) => transaction.setDescription(input)));
  }

  Container amountInput(Transaction transaction) {
    return Container(
        padding: EdgeInsets.all(30),
        child: CupertinoTextField(
            prefix: Text('\$'),
            keyboardType: TextInputType.numberWithOptions(),
            placeholder: '0.00',
            key: Key('amountInput'),
            onChanged: (input) => transaction.setAmount(double.parse(input))));
  }

  Container creditDebitSwitch(Transaction transaction){
    return Container(
      padding: EdgeInsets.all(40),
      child: Row(
        children: <Widget>[
          Text('   (-)Debit/ (+)Credit                      '),
          CupertinoSwitch(
            key: Key('creditDebit'),
            value: transaction.isCredit,
            onChanged: (bool value) => transaction.setIsCredit(value)),
        ],
      )
        );
  }

  Container reoccuringSwitch(Transaction transaction){
    return Container(
        padding: EdgeInsets.all(40),
        child: Row(
            children: <Widget>[
              Text('   Reoccuring Payment                   '),
              CupertinoSwitch(
                key: Key('reoccuring'),
                value: transaction.isReoccuring,
                onChanged: (bool value) => transaction.setIsReoccuring(value))
        ])
    );
  }
}
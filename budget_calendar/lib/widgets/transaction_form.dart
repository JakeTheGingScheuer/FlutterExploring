import 'package:budget_calendar/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  TransactionForm({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TransactionFormState();
  }
}

class TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter transaction amount';
              }
            },
            onFieldSubmitted: transactionList.add(value);
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {

                  Navigator.pop(context, MaterialPageRoute(
                      builder: (context) => TransactionList()
                  ));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
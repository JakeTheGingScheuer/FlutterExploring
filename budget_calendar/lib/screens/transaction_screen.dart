import 'package:budget_calendar/model/day_model.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget{

  DayModel dayModel;
  TransactionScreen(this.dayModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(),
        body: TransactionForm(this.dayModel),
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
  TextEditingController controller = TextEditingController();
  double transAmount = 0.0;

  TransactionFormState(this.dayModel);

  void setAmount(double input){
    transAmount = input;
  }
  void addToLedger(double amount, BuildContext context) {
    dayModel.addTrans('new trans', amount);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return
    Container(padding: EdgeInsets.all(25.0),
    child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 80),
        Text('Amount:'),
        SizedBox(height: 20),
        TextField(
          keyboardAppearance: Brightness.dark,
          keyboardType: TextInputType.number,
          controller: controller,
          decoration: InputDecoration(
              hintText: '\$0.00'
          ),
          onChanged: (input) => setAmount(double.parse(input)),
        ),
        SizedBox(height: 80),
        RaisedButton(
            child: Text('Add To Ledger'),
            color: Colors.red,
            onPressed: () => addToLedger(this.transAmount, context)
        )
      ],
    ));
  }
}
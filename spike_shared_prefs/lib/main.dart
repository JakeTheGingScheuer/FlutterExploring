import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//main method
void main() => runApp(MyApp());

//top level material app class
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

//Stateful widgets are just state classes in a wrapper
class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

//State is the actual implementation
class HomePageState extends State<HomePage>{
  String counterNumber = '';

  //this is where we can load a previous state
  @override
  void initState() {
    super.initState();

    int number = getCounterNumberFromSharedPref() as int;

    counterNumber = 'the saved state number is $getCounterNumberFromSharedPref';
  }

  //a button and text displayed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 250),
                RaisedButton(
                  onPressed: incrementCounter,
                  child: Text('increment')
                ),
                Text(counterNumber, style: TextStyle(fontSize: 32))
              ],
            )
        )
    );
  }

  //retrieves the data wanted
  Future<int> getCounterNumberFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('startupNumber');
    if(startupNumber == null){
      return 0;
    }
    return startupNumber;
  }

  //act upon data retrieved
  Future<void> incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    int startupNumber = prefs.getInt('startupNumber');
    startupNumber++;
    await prefs.setInt('startupNumber', startupNumber);
    setState(() => counterNumber = 'button pressed $startupNumber times');
  }
}

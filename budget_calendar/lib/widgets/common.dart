import 'package:flutter/material.dart';
import '../styles.dart';

class Common {
  static AppBar headBar() {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text('CalenDOOM V 6.6.6', style: Styles.headerLarge),
      leading: Builder(
          builder: (BuildContext context) {
            if(Navigator.canPop(context)) {
              return BackButton();
            }else return Container();
          })
    );
  }
}